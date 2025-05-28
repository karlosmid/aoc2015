defmodule Day10 do
  def part1(input) do
    do_part(input, 40)
  end

  def part2(input) do
    do_part(input, 50)
  end

  def do_part(input, 0), do: String.length(input)

  def do_part(input, n) do
    input
    |> String.split(~r/(?<=(.))(?!\1)/, trim: true)
    |> Enum.map(&decode/1)
    |> Enum.join("")
    |> do_part(n - 1)
  end

  def decode(input) do
    "#{String.length(input)}#{String.first(input)}"
  end
end
