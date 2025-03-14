defmodule Day02 do
  def part1(input) do
    part1(input, 0)
  end

  defp part1([], total), do: total

  defp part1([dimensions | rest], total) do
    part1(rest, total + paper_area(dimensions))
  end

  def paper_area(dimensions) do
    [l, w, h] = parse_dimensions(dimensions)
    area = 2 * l * w + 2 * w * h + 2 * h * l
    slack = Enum.min([l * w, w * h, h * l])
    area + slack
  end

  defp parse_dimensions(dimensions) do
    dimensions
    |> String.split("x")
    |> Enum.map(&String.to_integer/1)
  end

  def part2(input) do
    part2(input, 0)
  end

  defp part2([], total), do: total

  defp part2([dimensions | rest], total) do
    part2(rest, total + ribbon_length(dimensions))
  end

  def ribbon_length(dimensions) do
    [l, w, h] =
      parse_dimensions(dimensions)
      |> Enum.sort()

    2 * (l + w) + l * w * h
  end
end
