defmodule Day01Test do
  use ExUnit.Case

  test "day0101" do
    assert Day01.part1("data/day01/day0101.txt") == 0
  end

  test "day0102" do
    assert Day01.part1("data/day01/day0102.txt") == 3
  end

  test "day0103" do
    assert Day01.part1("data/day01/day0103.txt") == 1
  end

  test "puzzle" do
    assert Day01.part1("data/day01/day01.txt") == 232
  end
end
