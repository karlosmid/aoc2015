defmodule Day06 do
  def part1(input) do
    input
    |> parse_input()
    |> count_lights_on()
  end

  def part2(input) do
    input
    |> parse_input()
    |> calculate_total_brightness()
  end

  defp parse_input(input) do
    input
    |> Enum.map(&parse_instruction/1)
  end

  def parse_instruction(instruction) do
    case instruction do
      "turn on " <> rest -> {:on, parse_coordinates(rest)}
      "turn off " <> rest -> {:off, parse_coordinates(rest)}
      "toggle " <> rest -> {:toggle, parse_coordinates(rest)}
    end
  end

  defp parse_coordinates(coords) do
    [start, "through", finish] = String.split(coords, " ")
    [start_x, start_y] = String.split(start, ",") |> Enum.map(&String.to_integer/1)
    [end_x, end_y] = String.split(finish, ",") |> Enum.map(&String.to_integer/1)
    {{start_x, start_y}, {end_x, end_y}}
  end

  defp count_lights_on(instructions) do
    instructions
    |> Enum.reduce(%{}, fn instruction, grid ->
      apply_instruction(grid, instruction)
    end)
    |> Map.values()
    |> Enum.count(&(&1 == true))
  end

  defp calculate_total_brightness(instructions) do
    instructions
    |> Enum.reduce(%{}, fn instruction, grid ->
      apply_brightness_instruction(grid, instruction)
    end)
    |> Map.values()
    |> Enum.sum()
  end

  defp apply_instruction(grid, {:on, {{start_x, start_y}, {end_x, end_y}}}) do
    grid_on = %{}

    for x <- start_x..end_x, y <- start_y..end_y do
      Map.put(grid_on, {x, y}, true)
    end
    |> Enum.reduce(grid, &Map.merge(&2, &1))
  end

  defp apply_instruction(grid, {:off, {{start_x, start_y}, {end_x, end_y}}}) do
    grid_off = %{}

    for x <- start_x..end_x, y <- start_y..end_y do
      Map.put(grid_off, {x, y}, false)
    end
    |> Enum.reduce(grid, &Map.merge(&2, &1))
  end

  defp apply_instruction(grid, {:toggle, {{start_x, start_y}, {end_x, end_y}}}) do
    grid_toggle = %{}

    for x <- start_x..end_x, y <- start_y..end_y do
      Map.put(grid_toggle, {x, y}, !Map.get(grid, {x, y}, false))
    end
    |> Enum.reduce(grid, &Map.merge(&2, &1))
  end

  defp apply_brightness_instruction(grid, {:on, {{start_x, start_y}, {end_x, end_y}}}) do
    grid_on = %{}

    for x <- start_x..end_x, y <- start_y..end_y do
      Map.put(grid_on, {x, y}, Map.get(grid, {x, y}, 0) + 1)
    end
    |> Enum.reduce(grid, &Map.merge(&2, &1))
  end

  defp apply_brightness_instruction(grid, {:off, {{start_x, start_y}, {end_x, end_y}}}) do
    grid_off = %{}

    for x <- start_x..end_x, y <- start_y..end_y do
      Map.put(grid_off, {x, y}, max(0, Map.get(grid, {x, y}, 0) - 1))
    end
    |> Enum.reduce(grid, &Map.merge(&2, &1))
  end

  defp apply_brightness_instruction(grid, {:toggle, {{start_x, start_y}, {end_x, end_y}}}) do
    grid_toggle = %{}

    for x <- start_x..end_x, y <- start_y..end_y do
      Map.put(grid_toggle, {x, y}, Map.get(grid, {x, y}, 0) + 2)
    end
    |> Enum.reduce(grid, &Map.merge(&2, &1))
  end
end
