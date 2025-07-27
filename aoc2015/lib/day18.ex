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

  def step(grid, border, step, stop, part) do
    if step > stop do
      grid
    else
      Enum.reduce(grid, %{}, fn state, acc ->
        {{x, y}, state} = next_state(state, grid, border, part)
        Map.put(acc, {x, y}, state)
      end)
      |> step(border, step + 1, stop, part)
    end
  end

  def next_state({coordinates, "#"} = state, grid, border, 2) do
    case coordinates do
      {0, 0} -> state
      {0, ^border} -> state
      {^border, 0} -> state
      {^border, ^border} -> state
      _ -> next_state(state, grid, border, 1)
    end
  end

  def next_state({{x, y}, "#"}, grid, _border, 1) do
    case neighbours_on({x, y}, grid) do
      2 -> {{x, y}, "#"}
      3 -> {{x, y}, "#"}
      _ -> {{x, y}, "."}
    end
  end

  def next_state({coordinates, "."} = state, grid, border, 2) do
    case coordinates do
      {0, 0} -> {coordinates, "#"}
      {0, ^border} -> {coordinates, "#"}
      {^border, 0} -> {coordinates, "#"}
      {^border, ^border} -> {coordinates, "#"}
      _ -> next_state(state, grid, border, 1)
    end
  end

  def next_state({{x, y}, "."}, grid, _border, 1) do
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

  def part(path, steps, part) do
    grid = parse(path)

    step(grid, border_size(grid), 1, steps, part)
    |> Enum.filter(fn {_, state} -> state == "#" end)
    |> Enum.count()
  end

  def border_size(grid) do
    border =
      grid
      |> Map.keys()
      |> length
      |> :math.sqrt()
      |> round()

    border - 1
  end
end
