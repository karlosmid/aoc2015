defmodule Day03 do
  def part1(input), do: part1(input, 0, 0, %{{0, 0} => 1})

  defp part1([], _x, _y, visited_houses), do: Enum.count(visited_houses)

  defp part1([?^ | rest], x, y, visited_houses),
    do: part1(rest, x, y + 1, Map.put(visited_houses, {x, y + 1}, 1))

  defp part1([?v | rest], x, y, visited_houses),
    do: part1(rest, x, y - 1, Map.put(visited_houses, {x, y - 1}, 1))

  defp part1([?< | rest], x, y, visited_houses),
    do: part1(rest, x - 1, y, Map.put(visited_houses, {x - 1, y}, 1))

  defp part1([?> | rest], x, y, visited_houses),
    do: part1(rest, x + 1, y, Map.put(visited_houses, {x + 1, y}, 1))

  def part2(input) do
    part2(input, {0, 0}, {0, 0}, 0, %{{0, 0} => 1})
  end

  defp part2([], _santa_positon, _robo_positon, _input_position, visited_houses),
    do: Enum.count(visited_houses)

  defp part2([?^ | rest], {santa_x, santa_y}, {robo_x, robo_y}, input_position, visited_houses) do
    if rem(input_position, 2) == 0 do
      part2(
        rest,
        {santa_x, santa_y + 1},
        {robo_x, robo_y},
        input_position + 1,
        Map.put(visited_houses, {santa_x, santa_y + 1}, 1)
      )
    else
      part2(
        rest,
        {santa_x, santa_y},
        {robo_x, robo_y + 1},
        input_position + 1,
        Map.put(visited_houses, {robo_x, robo_y + 1}, 1)
      )
    end
  end

  defp part2([?v | rest], {santa_x, santa_y}, {robo_x, robo_y}, input_position, visited_houses) do
    if rem(input_position, 2) == 0 do
      part2(
        rest,
        {santa_x, santa_y - 1},
        {robo_x, robo_y},
        input_position + 1,
        Map.put(visited_houses, {santa_x, santa_y - 1}, 1)
      )
    else
      part2(
        rest,
        {santa_x, santa_y},
        {robo_x, robo_y - 1},
        input_position + 1,
        Map.put(visited_houses, {robo_x, robo_y - 1}, 1)
      )
    end
  end

  defp part2([?< | rest], {santa_x, santa_y}, {robo_x, robo_y}, input_position, visited_houses) do
    if rem(input_position, 2) == 0 do
      part2(
        rest,
        {santa_x - 1, santa_y},
        {robo_x, robo_y},
        input_position + 1,
        Map.put(visited_houses, {santa_x - 1, santa_y}, 1)
      )
    else
      part2(
        rest,
        {santa_x, santa_y},
        {robo_x - 1, robo_y},
        input_position + 1,
        Map.put(visited_houses, {robo_x - 1, robo_y}, 1)
      )
    end
  end

  defp part2([?> | rest], {santa_x, santa_y}, {robo_x, robo_y}, input_position, visited_houses) do
    if rem(input_position, 2) == 0 do
      part2(
        rest,
        {santa_x + 1, santa_y},
        {robo_x, robo_y},
        input_position + 1,
        Map.put(visited_houses, {santa_x + 1, santa_y}, 1)
      )
    else
      part2(
        rest,
        {santa_x, santa_y},
        {robo_x + 1, robo_y},
        input_position + 1,
        Map.put(visited_houses, {robo_x + 1, robo_y}, 1)
      )
    end
  end
end
