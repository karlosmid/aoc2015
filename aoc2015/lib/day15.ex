defmodule Day15 do
  def parse(input) do
    input
    |> Enum.map(fn line ->
      [_, name, capacity, durability, flavor, texture, calories] =
        Regex.run(
          ~r/(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)/,
          line
        )

      %{
        name: name,
        capacity: String.to_integer(capacity),
        durability: String.to_integer(durability),
        flavor: String.to_integer(flavor),
        texture: String.to_integer(texture),
        calories: String.to_integer(calories)
      }
    end)
  end

  def ratios(n) do
    cond do
      n == 4 ->
        for i <- 0..100,
            j <- 0..100,
            k <- 0..100,
            l <- 0..100,
            i + j + k + l == 100,
            do: [i, j, k, l]

      n == 2 ->
        for i <- 0..100, j <- 0..100, i + j == 100, do: [i, j]

      true ->
        raise "Invalid number of ingredients"
    end
  end

  def get_category(ingredients, type) do
    Enum.map(ingredients, &Map.get(&1, type))
  end

  def part1(input) do
    input = parse(input)
    n = length(input)
    capacity = get_category(input, :capacity)
    durability = get_category(input, :durability)
    flavour = get_category(input, :flavor)
    texture = get_category(input, :texture)

    ratios(n)
    |> Enum.map(fn ratio ->
      sum_category(ratio, capacity) * sum_category(ratio, durability) *
        sum_category(ratio, flavour) *
        sum_category(ratio, texture)
    end)
    |> Enum.max()
  end

  def part2(input) do
    input = parse(input)
    n = length(input)
    capacity = get_category(input, :capacity)
    durability = get_category(input, :durability)
    flavour = get_category(input, :flavor)
    texture = get_category(input, :texture)
    calories = get_category(input, :calories)

    ratios(n)
    |> Enum.map(fn ratio ->
      if sum_category(ratio, calories) == 500 do
        sum_category(ratio, capacity) * sum_category(ratio, durability) *
          sum_category(ratio, flavour) *
          sum_category(ratio, texture)
      else
        0
      end
    end)
    |> Enum.max()
  end

  defp sum_category(ratio, category) do
    sum =
      1..length(ratio)
      |> Enum.map(fn i ->
        Enum.at(ratio, i - 1) * Enum.at(category, i - 1)
      end)
      |> Enum.sum()

    if sum < 0 do
      0
    else
      sum
    end
  end
end
