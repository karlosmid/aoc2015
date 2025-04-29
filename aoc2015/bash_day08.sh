#!/bin/bash

file="data/day08.txt"

part1_total=0
part2_total=0

while IFS= read -r line; do
    code_length=${#line}

    # Remove surrounding quotes first
    memory=$(echo "$line" | sed -E 's/^"//; s/"$//')

    # Replace escaped characters
    memory=$(echo "$memory" | sed -E 's/\\\\/X/g; s/\\"/X/g; s/\\x[0-9a-fA-F]{2}/X/g')

    memory_length=${#memory}
    echo "\"Difference: $((code_length - memory_length))\""

    part1_total=$((part1_total + code_length - memory_length))

    # For part 2: escape \ and " and add 2 for new quotes
    encoded=$(echo "$line" | sed -E 's/\\/\\\\/g; s/"/\\"/g')
    encoded_length=$(( ${#encoded} + 2 ))

    part2_total=$((part2_total + encoded_length - code_length))
done < "$file"

echo "Part 1: $part1_total"
echo "Part 2: $part2_total"
