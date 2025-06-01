defmodule Day11Test do
  use ExUnit.Case

  test "increment single character" do
    assert Day11.increment(["a"]) == ["b"]
    assert Day11.increment(["z"]) == ["a"]
  end

  test "increment with carry" do
    assert Day11.increment(["a", "z"]) == ["b", "a"]
    assert Day11.increment(["z", "z"]) == ["a", "a"]
  end

  test "increment longer strings" do
    assert Day11.increment(["a", "a", "z"]) == ["a", "b", "a"]
    assert Day11.increment(["z", "z", "z"]) == ["a", "a", "a"]
  end

  test "string_to_list function" do
    assert Day11.string_to_list("abc") == ["a", "b", "c"]
    assert Day11.string_to_list("z") == ["z"]
  end

  test "has_consecutive_letters? with valid sequences" do
    assert Day11.has_consecutive_letters?(["a", "b", "c"]) == true
    assert Day11.has_consecutive_letters?(["x", "y", "z"]) == true
    assert Day11.has_consecutive_letters?(["h", "i", "j", "k"]) == true
  end

  test "has_consecutive_letters? with invalid sequences" do
    assert Day11.has_consecutive_letters?(["a", "a", "a"]) == false
    assert Day11.has_consecutive_letters?(["z", "y", "x"]) == false
    assert Day11.has_consecutive_letters?(["a", "c", "b"]) == false
  end

  test "has_consecutive_letters? with edge cases" do
    # longer than 3
    assert Day11.has_consecutive_letters?(["a", "b", "c", "d"]) == true
    # shorter than 3
    assert Day11.has_consecutive_letters?(["a", "b"]) == false
    # multiple sequences
    assert Day11.has_consecutive_letters?(["a", "b", "c", "a", "b", "c"]) == true
    # wrap around
    assert Day11.has_consecutive_letters?(["z", "a", "b"]) == false
  end

  test "has_forbidden_letters? with valid sequences" do
    assert Day11.has_forbidden_letters?(["a", "b", "c"]) == false
    assert Day11.has_forbidden_letters?(["x", "y", "z"]) == false
    assert Day11.has_forbidden_letters?(["h", "i", "j", "k"]) == true
  end

  test "has_two_pairs? with valid sequences" do
    assert Day11.has_two_pairs?(["a", "a", "b", "b"]) == true
    assert Day11.has_two_pairs?(["x", "x", "y", "z", "z"]) == true
    assert Day11.has_two_pairs?(["a", "a", "b", "c", "c"]) == true
    assert Day11.has_two_pairs?(["a", "b", "b", "a", "a"]) == true
  end

  test "has_two_pairs? with invalid sequences" do
    assert Day11.has_two_pairs?(["a", "b", "c"]) == false
    assert Day11.has_two_pairs?(["a", "a", "b", "c"]) == false
    assert Day11.has_two_pairs?(["a", "b", "c", "c"]) == false
    assert Day11.has_two_pairs?(["a", "a", "a", "a"]) == false
    # two pairs with extra letter
    assert Day11.has_two_pairs?(["a", "a", "b", "b", "b"]) == true
    # overlapping but distinct pairs
    assert Day11.has_two_pairs?(["x", "x", "y", "y", "x"]) == true
    # pairs separated by letter
    assert Day11.has_two_pairs?(["a", "a", "x", "b", "b"]) == true
    # pairs at start and end
    assert Day11.has_two_pairs?(["c", "c", "d", "e", "e"]) == true
  end

  test "input 1" do
    assert Day11.part1("cqjxjnds") == "cqjxxyzz"
  end

  test "input 2" do
    assert Day11.part1("cqjxxyzz") == "cqkaabcc"
  end
end
