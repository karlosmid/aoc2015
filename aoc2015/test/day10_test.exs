defmodule Day10Test do
  use ExUnit.Case

  test "part1 with example input" do
    input = "1"
    assert Day10.part1(input) == 82350
  end

  test "part1 with test input" do
    assert Day10.part1("3113322113") == 329_356
  end

  test "part2 with test input" do
    assert Day10.part2("3113322113") == 4_666_278
  end
end
