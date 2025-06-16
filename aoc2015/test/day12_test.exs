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
    assert Day12.part1(input) == 111_754
  end

  test "parse_json" do
    input = "[1,2,3]"
    assert Day12.parse_json(input) == [1, 2, 3]
  end

  test "parse_json with nested arrays" do
    input = "[1,[2,3],4]"
    assert Day12.parse_json(input) == [1, [2, 3], 4]
  end

  test "parse_json with nested objects" do
    input = "{\"a\":1,\"b\":2}"
    result = Day12.parse_json(input)
    assert result == %{"a" => 1, "b" => 2}
    assert Day12.is_object_red?(result) == false
  end

  test "parse_json with nested arrays and objects" do
    input = "[1,{\"a\":2},3]"
    result = Day12.parse_json(input)
    assert result == [1, %{"a" => 2}, 3]
    assert Day12.is_array?(result)
  end

  test "is_object_red?" do
    assert Day12.is_object_red?(%{"a" => 1, "b" => 2}) == false
    assert Day12.is_object_red?(%{"a" => 1, "b" => "red"}) == true
    assert Day12.is_object_red?(%{"a" => "red", "b" => 2}) == true
    assert Day12.is_object_red?(%{"a" => "red", "b" => "red"}) == true
    assert Day12.is_object_red?(["red", 1, "a"]) == false
  end

  test "sum_array" do
    assert Day12.sum_array([1, 2, 3]) == 6
    assert Day12.sum_array([1, [2, 3], 4]) == 10
    assert Day12.sum_array([1, [[[[4]]]], 3]) == 8
  end

  test "parse_json with input file" do
    input = Data.read_file("data/day12.txt")
    result = Day12.parse_json(input)
    IO.inspect(Map.keys(result))
  end

  test "sum_array with nested arrays" do
    assert Day12.sum_array([1, [2, 3], 4]) == 10
    assert Day12.sum_array([1, [[[[4]]]], 3]) == 8
    assert Day12.sum_array([1, [2, [3, [4, ["red", 6]]]]]) == 16
  end

  test "sum_object" do
    assert Day12.sum_object(%{"a" => 1, "b" => 2}) == 3
    assert Day12.sum_object(%{"a" => 1, "b" => "red"}) == 0
    assert Day12.sum_object(%{"a" => "red", "b" => 2}) == 0
    assert Day12.sum_object(%{"a" => "red", "b" => "red"}) == 0
    assert Day12.sum_object(%{"a" => %{"b" => 2}, "c" => 3}) == 5
    assert Day12.sum_object(%{"a" => %{"b" => "red"}, "c" => 3}) == 3
    assert Day12.sum_object(%{"a" => %{"b" => 2}, "c" => "red"}) == 0
  end

  test "part2 with input file" do
    input = Data.read_file("data/day12.txt")
    assert Day12.part2(input) == 65_402
  end
end
