defmodule Day12 do
  def part1(input) do
    input
    |> find_integers()
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> parse_json()
    |> sum_object()
  end

  def find_integers(input) do
    Regex.scan(~r/-?\d+/, input)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)
  end

  def parse_json(input) do
    Jason.decode!(input)
  end

  def is_array?(value), do: is_list(value)
  def is_object?(value), do: is_map(value)

  def is_object_red?(value),
    do: is_map(value) and Enum.any?(value, fn {_key, value} -> value == "red" end)

  def sum_array(value) do
    sum_array(value, 0)
  end

  defp sum_array([], sum), do: sum

  defp sum_array([head | tail], sum) do
    new_sum =
      cond do
        is_object?(head) -> sum + sum_object(head)
        is_array?(head) -> sum + sum_array(head)
        is_integer(head) -> sum + head
        true -> sum
      end

    sum_array(tail, new_sum)
  end

  def sum_object(value) do
    if not is_object_red?(value) do
      sum_object(Map.values(value), 0)
    else
      0
    end
  end

  defp sum_object([], sum), do: sum

  defp sum_object([head | tail], sum) do
    new_sum =
      cond do
        is_object?(head) -> sum + sum_object(head)
        is_array?(head) -> sum + sum_array(head)
        is_integer(head) -> sum + head
        true -> sum
      end

    sum_object(tail, new_sum)
  end
end
