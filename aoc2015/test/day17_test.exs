defmodule Day17Test do
  use ExUnit.Case

  test "parse" do
    input =
      Data.read_file_as_list_of_strings("data/day17.txt")
      |> Enum.map(&Integer.parse(&1))
      |> Enum.map(fn {number, ""} -> number end)

    assert input == [43, 3, 4, 10, 21, 44, 4, 6, 47, 41, 34, 17, 17, 44, 36, 31, 46, 9, 27, 38]
  end

  test "combinations_without_repetition 3" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(3)
           |> Enum.filter(fn [a, b, c] -> a + b + c == 150 end)
           |> Enum.count() ==
             0
  end

  test "combinations_without_repetition 4" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(4)
           |> Enum.filter(fn x -> Enum.sum(x) == 150 end)
           |> Enum.count() ==
             17
  end

  test "combinations_without_repetition 5" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(5)
           |> Enum.filter(fn [a, b, c, d, e] -> a + b + c + d + e == 150 end)
           |> Enum.count() ==
             151
  end

  test "combinations_without_repetition 6" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(6)
           |> Enum.filter(fn [a, b, c, d, e, f] -> a + b + c + d + e + f == 150 end)
           |> Enum.count() ==
             441
  end

  test "combinations_without_repetition 7" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(7)
           |> Enum.filter(fn [a, b, c, d, e, f, g] -> a + b + c + d + e + f + g == 150 end)
           |> Enum.count() ==
             552
  end

  test "combinations_without_repetition 8" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(8)
           |> Enum.filter(fn [a, b, c, d, e, f, g, h] -> a + b + c + d + e + f + g + h == 150 end)
           |> Enum.count() ==
             356
  end

  test "combinations_without_repetition 9" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(9)
           |> Enum.filter(fn [a, b, c, d, e, f, g, h, i] ->
             a + b + c + d + e + f + g + h + i == 150
           end)
           |> Enum.count() ==
             110
  end

  test "combinations_without_repetition 10" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(10)
           |> Enum.filter(fn [a, b, c, d, e, f, g, h, i, j] ->
             a + b + c + d + e + f + g + h + i + j == 150
           end)
           |> Enum.count() ==
             11
  end

  test "combinations_without_repetition 11" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.combinations_without_repetition(11)
           |> Enum.filter(fn [a, b, c, d, e, f, g, h, i, j, k] ->
             a + b + c + d + e + f + g + h + i + j + k == 150
           end)
           |> Enum.count() ==
             0
  end

  test "part1" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.part1() ==
             1638
  end

  test "part2" do
    assert Data.read_file_as_list_of_strings("data/day17.txt")
           |> Enum.map(&Integer.parse(&1))
           |> Enum.map(fn {number, ""} -> number end)
           |> Day17.part2() == {17, 4}
  end
end
