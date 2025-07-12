defmodule Day16Test do
  use ExUnit.Case

  test "parse" do
    input = Data.read_file_as_list_of_strings("data/day16.txt")

    assert Enum.at(Day16.parse(input), 0) == %{sue: "1", goldfish: 6, trees: 9, akitas: 0}
  end

  test "part1" do
    Data.read_file_as_list_of_strings("data/day16.txt")
    |> Day16.part1()
    |> IO.inspect()
  end
end
