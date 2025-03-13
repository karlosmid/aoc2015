defmodule Day01 do
  def part1(input), do: part1(input, 0)

  defp part1([], floor), do: floor
  defp part1([?( | rest], floor), do: part1(rest, floor + 1)
  defp part1([?) | rest], floor), do: part1(rest, floor - 1)

  def part2(input) do
    part2(input, 0, 1)
  end

  defp part2(_, -1, pos), do: pos - 1

  defp part2([], _floor, _pos), do: "We never reached the basement"

  defp part2([?( | rest], floor, pos), do: part2(rest, floor + 1, pos + 1)
  defp part2([?) | rest], floor, pos), do: part2(rest, floor - 1, pos + 1)
end
