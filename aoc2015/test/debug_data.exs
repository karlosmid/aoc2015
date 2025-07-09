defmodule DebugData do
  def test_data_reading do
    input = Data.read_file_as_list_of_strings("data/day15.txt")
    IO.puts("Number of lines: #{length(input)}")

    Enum.with_index(input)
    |> Enum.each(fn {line, index} ->
      IO.puts("Line #{index}: '#{line}' (length: #{String.length(line)})")

      pattern =
        ~r/(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)/

      case Regex.run(pattern, line) do
        nil ->
          IO.puts("  -> Regex failed to match!")
          IO.puts("  -> Line bytes: #{inspect(String.to_charlist(line))}")

        result ->
          IO.puts("  -> Regex matched: #{inspect(result)}")
      end
    end)
  end
end

DebugData.test_data_reading()
