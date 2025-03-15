defmodule Day03 do
  def part1(input), do: part1(input, 0, 0, %{{0,0} => 1})

  defp part1([], _x, _y, visited_houses), do: Enum.count(visited_houses)

  defp part1([?^ | rest], x, y, visited_houses),
    do: part1(rest, x, y + 1, Map.put(visited_houses, {x, y + 1}, 1))

  defp part1([?v | rest], x, y, visited_houses),
    do: part1(rest, x, y - 1, Map.put(visited_houses, {x, y - 1}, 1))

  defp part1([?< | rest], x, y, visited_houses),
    do: part1(rest, x - 1, y, Map.put(visited_houses, {x - 1, y}, 1))

  defp part1([?> | rest], x, y, visited_houses),
    do: part1(rest, x + 1, y, Map.put(visited_houses, {x + 1, y}, 1))
end
