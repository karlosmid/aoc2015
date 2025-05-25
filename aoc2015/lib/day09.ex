defmodule Day09 do
  def part1(input) do
    part(input)
    |> Enum.min()
  end

  def part2(input) do
    part(input)
    |> Enum.max()
  end

  def part(input) do
    routes = parse(input)
    cities = cities(routes)
    all_routes = all_routes(cities)

    all_routes
    |> Enum.map(fn route -> route_pairs(route) end)
    |> Enum.map(fn route ->
      route
      |> Enum.reduce(0, fn {start, stop}, acc ->
        acc + routes[{start, stop}]
      end)
    end)
  end

  def parse(input),
    do:
      input
      |> Enum.reduce(%{}, fn line, acc ->
        [_, start, destination, distance] = Regex.run(~r/(\w+) to (\w+) = (\d+)/, line)

        acc
        |> Map.put({start, destination}, String.to_integer(distance))
        |> Map.put({destination, start}, String.to_integer(distance))
      end)

  def all_routes(cities) do
    permutations(cities)
  end

  def cities(parsed_input) do
    parsed_input
    |> Map.keys()
    |> Enum.reduce([], fn {start, destination}, acc ->
      [start | [destination | acc]]
    end)
    |> Enum.uniq()
  end

  def route_pairs(routes) do
    routes
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [start, stop] ->
      {start, stop}
    end)
  end

  def permutations([]), do: [[]]

  def permutations(list) do
    for x <- list, rest <- permutations(list -- [x]), do: [x | rest]
  end
end
