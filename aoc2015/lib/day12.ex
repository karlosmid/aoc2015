defmodule Day12 do
  def part1(input) do
    input
    |> find_integers()
    |> Enum.sum()
  end

  def find_integers(input) do
    Regex.scan(~r/-?\d+/, input)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)
  end
end
