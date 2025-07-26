defmodule Day18 do
  def parse(input) do
    input =
      Data.read_file_as_list_of_lists(input)
      |> Enum.with_index(fn row, x ->
        Enum.with_index(row, fn element, y -> {{x, y}, element} end)
      end)
      |> List.flatten()

    Enum.reduce(input, %{}, fn {{x, y}, state}, acc -> Map.put(acc, {x, y}, state) end)
  end

  def step(grid, step, stop) do
    if step > stop do
      grid
    else
      Enum.reduce(grid, %{}, fn state, acc ->
        {{x, y}, state} = next_state(state, grid)
        Map.put(acc, {x, y}, state)
      end)
      |> step(step + 1, stop)
    end
  end

  def next_state({{x, y}, "#"}, grid) do
    case neighbours_on({x, y}, grid) do
      2 -> {{x, y}, "#"}
      3 -> {{x, y}, "#"}
      _ -> {{x, y}, "."}
    end
  end

  def next_state({{x, y}, "."}, grid) do
    case neighbours_on({x, y}, grid) do
      3 -> {{x, y}, "#"}
      _ -> {{x, y}, "."}
    end
  end

  def neighbours_on({x, y}, grid) do
    [
      Map.get(grid, {x - 1, y - 1}, "."),
      Map.get(grid, {x - 1, y}, ","),
      Map.get(grid, {x - 1, y + 1}, "."),
      Map.get(grid, {x, y - 1}, "."),
      Map.get(grid, {x, y + 1}, "."),
      Map.get(grid, {x + 1, y}, "."),
      Map.get(grid, {x + 1, y + 1}, "."),
      Map.get(grid, {x + 1, y - 1}, ".")
    ]
    |> Enum.filter(fn bulb -> bulb == "#" end)
    |> Enum.count()
  end

  def part1(path, steps) do
    parse(path)
    |> step(1, steps)
    |> Enum.filter(fn {_, state} -> state == "#" end)
    |> Enum.count()
  end
end
