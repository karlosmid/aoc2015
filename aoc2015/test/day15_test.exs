defmodule Day15Test do
  use ExUnit.Case

  test "parse" do
    input = Data.read_file_as_list_of_strings("data/day15.txt")

    assert Day15.parse(input) == [
             %{name: "Sugar", calories: 2, capacity: 3, durability: 0, flavor: 0, texture: -3},
             %{
               name: "Sprinkles",
               calories: 9,
               capacity: -3,
               durability: 3,
               flavor: 0,
               texture: 0
             },
             %{name: "Candy", calories: 1, capacity: -1, durability: 0, flavor: 4, texture: 0},
             %{name: "Chocolate", calories: 8, capacity: 0, durability: 0, flavor: -2, texture: 2}
           ]

    assert length(Day15.parse(input)) == 4
  end

  test "permutations" do
    assert length(Day15.ratios(4)) == 176_851
    assert length(Day15.ratios(2)) == 101
  end

  test "categories" do
    calories =
      Data.read_file_as_list_of_strings("data/day15.txt")
      |> Day15.parse()
      |> Day15.get_category(:calories)

    assert calories == [2, 9, 1, 8]
  end

  test "example part1" do
    input = [
      "Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8",
      "Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3"
    ]

    assert Day15.part1(input) == 62_842_880
  end

  test "example part2" do
    input = [
      "Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8",
      "Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3"
    ]

    assert Day15.part2(input) == 57_600_000
  end

  test "part1" do
    result =
      Data.read_file_as_list_of_strings("data/day15.txt")
      |> Day15.part1()

    assert result == 222_870
  end

  test "part2" do
    result =
      Data.read_file_as_list_of_strings("data/day15.txt")
      |> Day15.part2()

    assert result == 117_936
  end
end
