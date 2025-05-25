defmodule Day08 do
  def part1_with_eval(input) do
    input
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn line ->
      code_length = String.length(line)
      memory_length = line |> Code.eval_string() |> elem(0) |> String.length()
      code_length - memory_length
    end)
    |> Enum.sum()
  end

  def part1(input) do
    input
    |> Enum.map(&code_vs_memory/1)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> Enum.map(&code_vs_memory_part2/1)
    |> Enum.sum()
  end

  defp code_vs_memory(string) do
    code_length = String.length(string)

    decoded =
      string
      |> String.replace(~r/^\"|\"$/, "")
      |> decode()

    memory_length = String.length(decoded)
    diff = code_length - memory_length
    diff
  end

  defp code_vs_memory_part2(string) do
    code_length = String.length(string)

    encoded =
      string
      |> String.replace(~r/^\"|\"$/, "XXX")
      |> encode()

    encoded_length = String.length(encoded)
    encoded_length - code_length
  end

  defp encode(string) do
    string
    # Replace \\ with \
    |> String.replace("\\\\", "BBBB")
    # Replace \" with "
    |> String.replace("\\\"", "BBBD")
    # Replace \x?? with 1 character
    |> String.replace(~r/\\x[0-9a-fA-F]{2}/, "BBXNN")
  end

  defp decode(string) do
    string
    # Replace \\ with \
    |> String.replace("\\\\", "X")
    # Replace \" with "
    |> String.replace("\\\"", "X")
    # Replace \x?? with 1 character
    |> String.replace(~r/\\x[0-9a-fA-F]{2}/, "X")
  end
end
