defmodule Day02 do
  def part1(input) do
    part1(input, 0)
  end

  defp part1([], total), do: total
  defp part1([dimensions | rest], total) do
    part1(rest, total + paper_area(dimensions))
  end

  def paper_area(dimensions) do
    [l, w, h] = dimensions
                |> String.split("x")
                |> Enum.map(&String.to_integer/1)
    area = 2 * l * w + 2 * w * h + 2 * h * l
    slack = Enum.min([l * w, w * h, h * l])
    area + slack
  end
end
