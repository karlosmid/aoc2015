defmodule Day16 do
  @results %{
    children: 3,
    cats: 7,
    samoyeds: 2,
    pomeranians: 3,
    akitas: 0,
    vizslas: 0,
    goldfish: 5,
    trees: 3,
    cars: 2,
    perfumes: 1
  }

  def parse(input) do
    input
    |> Enum.map(fn line ->
      [_, sue, prop_1, prop_1_value, prop_2, prop_2_value, prop_3, prop_3_value] =
        Regex.run(
          ~r/\w+ (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)/,
          line
        )

      Map.put(%{}, :sue, sue)
      |> Map.put(String.to_atom(prop_1), String.to_integer(prop_1_value))
      |> Map.put(String.to_atom(prop_2), String.to_integer(prop_2_value))
      |> Map.put(String.to_atom(prop_3), String.to_integer(prop_3_value))
    end)
  end

  def part1(input) do
    parse(input)
    |> Enum.map(fn sue ->
      value =
        Map.keys(sue)
        |> Enum.filter(fn key -> key != :sue end)
        |> Enum.map(fn key ->
          abs(Map.get(@results, key) - Map.get(sue, key))
        end)
        |> Enum.sum()

      %{sue: sue.sue, value: value}
    end)
    |> Enum.min_by(fn value -> value.value end)
  end
end
