defmodule Day09Test do
  use ExUnit.Case

  test "parse input" do
    input = [
      "London to Dublin = 464",
      "London to Belfast = 518",
      "Dublin to Belfast = 141"
    ]

    expected = %{
      {"Belfast", "Dublin"} => 141,
      {"Belfast", "London"} => 518,
      {"Dublin", "Belfast"} => 141,
      {"Dublin", "London"} => 464,
      {"London", "Belfast"} => 518,
      {"London", "Dublin"} => 464
    }

    assert Day09.parse(input) == expected
  end

  test "parse single route" do
    input = [
      "London to Dublin = 464"
    ]

    expected =
      %{{"Dublin", "London"} => 464, {"London", "Dublin"} => 464}

    assert Day09.parse(input) == expected
  end

  test "all routes" do
    input = ["London", "Dublin", "Belfast"]

    assert Day09.all_routes(input) == [
             ["London", "Dublin", "Belfast"],
             ["London", "Belfast", "Dublin"],
             ["Dublin", "London", "Belfast"],
             ["Dublin", "Belfast", "London"],
             ["Belfast", "London", "Dublin"],
             ["Belfast", "Dublin", "London"]
           ]
  end

  test "cities" do
    input = [
      "London to Dublin = 464",
      "London to Belfast = 518",
      "Dublin to Belfast = 141"
    ]

    assert Day09.cities(Day09.parse(input)) == ["London", "Dublin", "Belfast"]
  end

  test "route pairs" do
    input = [
      "London",
      "Dublin",
      "Belfast"
    ]

    assert Data.pairs(input) == [
             {"London", "Dublin"},
             {"Dublin", "Belfast"}
           ]
  end

  test "part1 with example input" do
    input = [
      "London to Dublin = 464",
      "London to Belfast = 518",
      "Dublin to Belfast = 141"
    ]

    assert Day09.part1(input) == 605
  end

  test "part1 with data file" do
    input = Data.read_file_as_list_of_strings("data/day09.txt")
    assert Day09.part1(input) == 251
  end

  test "part2 with data file" do
    input = Data.read_file_as_list_of_strings("data/day09.txt")
    assert Day09.part2(input) == 898
  end
end
