defmodule Day13 do
  def part1(input) do
    input_parsed = parse(input)

    input_parsed
    |> all_persons()
    |> Data.permutations()
    |> Enum.map(fn table ->
      sum_happiness(table, input_parsed) + sum_happiness(Enum.reverse(table), input_parsed)
    end)
    |> Enum.max()
  end

  defp sum_happiness(table, input_parsed) do
    Data.pairs(table) ++ [{List.last(table), List.first(table)}]
    |> Enum.map(fn {person1, person2} ->
      Enum.find(input_parsed, fn %{person: person, neighbor: neighbor} ->
        person == person1 and neighbor == person2
      end)
      |> Map.get(:amount)
    end)
    |> Enum.sum()
  end

  def parse(input) do
    input
    |> Enum.map(fn line ->
      [_, person, gain_or_lose, amount, neighbor] =
        Regex.run(~r/(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)\./, line)

      amount =
        case gain_or_lose do
          "gain" -> String.to_integer(amount)
          "lose" -> -String.to_integer(amount)
        end

      %{person: person, neighbor: neighbor, amount: amount}
    end)
  end

  def all_persons(parsed_input) do
    parsed_input
    |> Enum.map(fn %{person: person} -> person end)
    |> Enum.uniq()
  end
end
