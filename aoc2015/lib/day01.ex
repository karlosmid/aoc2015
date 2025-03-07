defmodule Day01 do
  def part1(input) do
    part1(read_file_as_charlist(input), 0)
  end

  defp part1([], floor), do: floor
  defp part1([?( | rest], floor), do: part1(rest, floor + 1)
  defp part1([?) | rest], floor), do: part1(rest, floor - 1)

  def part2(input) do
    input
    |> String.graphemes()
    |> Enum.with_index(1)
    |> Enum.reduce_while(0, fn
      {"(", _pos}, -1 -> {:halt, -1}
      {")", pos}, 0 -> {:halt, pos}
      {"(", _pos}, acc -> {:cont, acc + 1}
      {")", _pos}, acc -> {:cont, acc - 1}
    end)
  end

  defp read_file_as_charlist(path) do
    path
    |> File.stream!([], 8192)
    |> Enum.join()
    |> String.to_charlist()
  end
end
