defmodule Day08Test do
  use ExUnit.Case

  test "part1 with example input" do
    input = [
      "\"\"",
      "\"abc\"",
      "\"aaa\\\"aaa\"",
      "\"\\x27\""
    ]

    assert Day08.part1(input) == 12
  end

  test "part1 with various string cases" do
    assert Day08.part1(["\"\""]) == 2
    assert Day08.part1(["\"abc\""]) == 2
    assert Day08.part1(["\"aaa\\\"aaa\""]) == 3
    assert Day08.part1(["\"\\x27\""]) == 5
    assert Day08.part1(["\"\\\\\"", "\"\\\"\""]) == 6
    assert Day08.part1(["\"\\zrs\\syur\""]) == 2
  end

  test "part1 with basic string patterns" do
    # Empty string
    assert Day08.part1(["\"\""]) == 2
    # Single character
    assert Day08.part1(["\"a\""]) == 2
    # Escaped quote
    assert Day08.part1(["\"\\\"\""]) == 3
  end

  test "part1 with double backslash" do
    assert Day08.part1(["\"\\\\zrs\\\\syur\""]) == 4
  end

  test "part1 problematic line" do
    assert Day08.part1(["\"ubgxxcvnltzaucrzg\\\\xcez\""]) == 3
  end

  test "part1 with multiple strings" do
    input = [
      "\"\"",
      "\"abc\"",
      "\"aaa\\\"aaaa\"",
      "\"\\x27\""
    ]

    assert Day08.part1(input) == 12
  end

  test "part1 with input data" do
    input = Data.read_file_as_list_of_strings("data/day08.txt")
    assert Day08.part1(input) == 1342
  end

  test "part1_with_eval with input data" do
    input = Data.read_file_as_list_of_strings("data/day08.txt")
    assert Day08.part1_with_eval(input) == 1342
  end

  test "part2 with empty string" do
    input = [
      "\"\""
    ]

    assert Day08.part2(input) == 4
  end

  test "part2 with abc" do
    input = [
      "\"abc\""
    ]

    assert Day08.part2(input) == 4
  end

  test "part2 with aaaDaaa" do
    input = [
      "\"aaa\\\"aaa\""
    ]

    assert Day08.part2(input) == 6
  end

  test "part2 with Bx27" do
    input = [
      "\"\\x27\""
    ]

    assert Day08.part2(input) == 5
  end

  test "part2 with input data" do
    input = Data.read_file_as_list_of_strings("data/day08.txt")
    assert Day08.part2(input) == 2074
  end
end
