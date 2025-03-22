#!/bin/bash

# Script to capture git staged changes and prepare a prompt for LLM

# Default repository path
repo_dir="."

# Parse named arguments
while [ "$#" -gt 0 ]; do
    case "$1" in
        -p=*|--path=*)
            repo_dir="${1#*=}"
            shift
            ;;
        -p|--path)
            if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
                repo_dir="$2"
                shift 2
            else
                echo "Error: Argument for $1 is missing" >&2
                exit 1
            fi
            ;;
        -i=*|--issue=*)
            issue_number="${1#*=}"
            shift
            ;;
        -i|--issue)
            if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
                issue_number="$2"
                shift 2
            else
                echo "Error: Argument for $1 is missing" >&2
                exit 1
            fi
            ;;
        *)
            echo "Unknown parameter: $1" >&2
            echo "Usage: $0 [-p|--path=/path/to/repo] [-i|--issue=ISSUE_NUMBER]" >&2
            exit 1
            ;;
    esac
done

# Check if the directory exists
if [ ! -d "$repo_dir" ]; then
    echo "Error: Directory '$repo_dir' does not exist."
    exit 1
fi

# Change to the specified directory
cd "$repo_dir" || { echo "Error: Could not change to directory '$repo_dir'."; exit 1; }

# Check if the directory is a git repository
if [ ! -d ".git" ] && ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: '$repo_dir' is not a git repository."
    exit 1
fi

# Run git diff --staged and capture the output in a variable
diff_output=$(git diff --staged)

# Check if there are any staged changes
if [ -z "$diff_output" ]; then
    echo "Error: No staged changes found in '$repo_dir'. Use 'git add' to stage files first."
    exit 1
fi

# Get the list of staged files for additional context
staged_files=$(git diff --staged --name-only)

# Create the prompt with the git diff output
prompt="I have the following changes staged for commit. Here's the git diff output:

Staged files:
$staged_files

Diff details:
\`\`\`
$diff_output
\`\`\`

Based on these changes, please help me craft a semantic release commit message following the conventional commits format. "\
"Consider whether this is a feat, fix, docs, refactor, etc., and suggest an appropriate scope if applicable. "\
"Also note if there are any breaking changes that should be highlighted. "\
"When suggesting commit messages, always include an appropriate emoji icon at the beginning of the message following the git-cz convention."

# Add issue information if provided
if [ -n "$issue_number" ]; then
    prompt+="

Please include a reference to close issue #$issue_number in the commit message. Use the appropriate syntax like 'closes #$issue_number' or 'fixes #$issue_number' in the footer of the commit message."
fi

# Copy the prompt to clipboard
# Try different clipboard commands based on the OS
if command -v pbcopy > /dev/null; then
    # macOS
    echo "$prompt" | pbcopy
    echo "Prompt copied to clipboard (macOS)"
elif command -v xclip > /dev/null; then
    # Linux with xclip
    echo "$prompt" | xclip -selection clipboard
    echo "Prompt copied to clipboard (Linux xclip)"
elif command -v xsel > /dev/null; then
    # Linux with xsel
    echo "$prompt" | xsel --clipboard
    echo "Prompt copied to clipboard (Linux xsel)"
elif command -v clip.exe > /dev/null; then
    # Windows with WSL
    echo "$prompt" | clip.exe
    echo "Prompt copied to clipboard (Windows)"
else
    echo "Could not copy to clipboard. No supported clipboard utility found."
    echo "Here's the prompt you can copy manually:"
    echo "----------------------------------------"
    echo "$prompt"
    echo "----------------------------------------"
fi

echo "Script completed. Paste the clipboard contents to LLM."