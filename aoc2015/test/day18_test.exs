defmodule Day18Test do
  use ExUnit.Case

  test "parse" do
    result = Day18.parse("data/day18.txt")
    assert result[{0, 0}] == "#"
    assert result[{99, 99}] == "#"
    assert Day18.neighbours_on({0, 0}, result) == 1
    assert Day18.neighbours_on({2, 1}, result) == 4
  end

  test "part1 example" do
    assert Day18.part1("data/day18_example.txt", 4) == 4
  end

  test "part1" do
    assert Day18.part1("data/day18.txt", 100) == 1061
  end
end
