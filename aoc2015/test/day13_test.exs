defmodule Day13Test do
  use ExUnit.Case

  test "parse" do
    input = ["Alice would gain 54 happiness units by sitting next to Bob."]
    assert Day13.parse(input) == [%{person: "Alice", neighbor: "Bob", amount: 54}]
  end

  test "all_persons" do
    input = Data.read_file_as_list_of_strings("data/day13.txt")
    parsed_input = Day13.parse(input)

    assert Day13.all_persons(parsed_input) == [
             "Alice",
             "Bob",
             "Carol",
             "David",
             "Eric",
             "Frank",
             "George",
             "Mallory"
           ]
  end

  test "permutations" do
    assert Data.permutations(["Alice", "Bob", "Carol"]) == [
             ["Alice", "Bob", "Carol"],
             ["Alice", "Carol", "Bob"],
             ["Bob", "Alice", "Carol"],
             ["Bob", "Carol", "Alice"],
             ["Carol", "Alice", "Bob"],
             ["Carol", "Bob", "Alice"]
           ]
  end

  test "part1_example" do
    input = [
      "Alice would gain 54 happiness units by sitting next to Bob.",
      "Alice would lose 79 happiness units by sitting next to Carol.",
      "Alice would lose 2 happiness units by sitting next to David.",
      "Bob would gain 83 happiness units by sitting next to Alice.",
      "Bob would lose 7 happiness units by sitting next to Carol.",
      "Bob would lose 63 happiness units by sitting next to David.",
      "Carol would lose 62 happiness units by sitting next to Alice.",
      "Carol would gain 60 happiness units by sitting next to Bob.",
      "Carol would gain 55 happiness units by sitting next to David.",
      "David would gain 46 happiness units by sitting next to Alice.",
      "David would lose 7 happiness units by sitting next to Bob.",
      "David would gain 41 happiness units by sitting next to Carol."
    ]

    assert Day13.part1(input) == 330
  end

  test "part1" do
    input = Data.read_file_as_list_of_strings("data/day13.txt")
    assert Day13.part1(input) == 330
  end
end
