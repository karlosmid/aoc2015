defmodule Day16Test do
  use ExUnit.Case

  test "parse" do
    input = Data.read_file_as_list_of_strings("data/day16.txt")

    assert Enum.at(Day16.parse(input), 0) == %{sue: "1", goldfish: 6, trees: 9, akitas: 0}
  end

  test "part1" do
    assert Data.read_file_as_list_of_strings("data/day16.txt")
           |> Day16.part1() ==
             %{value: 0, sue: "103"}
  end

  test "part2" do
    assert Data.read_file_as_list_of_strings("data/day16.txt")
           |> Day16.part2() ==
             %{sue: %{trees: 8, cars: 2, perfumes: 1, sue: "405"}, value: true}
  end
end
