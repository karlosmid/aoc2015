defmodule Day12Test do
  use ExUnit.Case

  test "find_integers with positive numbers" do
    assert Day12.find_integers("abc123def456") == [123, 456]
    assert Day12.find_integers("123") == [123]
    assert Day12.find_integers("abc123") == [123]
  end

  test "find_integers with negative numbers" do
    assert Day12.find_integers("abc-123def-456") == [-123, -456]
    assert Day12.find_integers("-123") == [-123]
    assert Day12.find_integers("abc-123") == [-123]
  end

  test "find_integers with mixed numbers" do
    assert Day12.find_integers("abc123def-456ghi789") == [123, -456, 789]
    assert Day12.find_integers("123-456") == [123, -456]
  end

  test "find_integers with no numbers" do
    assert Day12.find_integers("abc") == []
    assert Day12.find_integers("") == []
  end

  test "part1 with example input" do
    input = """
    [1,2,3]
    {"a":2,"b":4}
    [[[3]]]
    {"a":{"b":4},"c":-1}
    {"a":[-1,1]}
    [-1,{"a":1}]
    []
    {}
    """

    assert Day12.part1(input) == 18
  end

  test "part1 with simple input" do
    input = "[1,2,3]"
    assert Day12.part1(input) == 6
  end

  test "part1 with negative numbers" do
    input = "[-1,2,-3]"
    assert Day12.part1(input) == -2
  end

  test "part1 with input file" do
    input = Data.read_file("data/day12.txt")
    assert Day12.part1(input) == 111754
  end
end
