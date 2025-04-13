defmodule Day06Test do
  use ExUnit.Case

  describe "part1/1" do
    test "empty input returns 0" do
      assert Day06.part1([]) == 0
    end

    test "turn on all lights" do
      input = ["turn on 0,0 through 999,999"]
      assert Day06.part1(input) == 1_000_000
    end

    test "toggle first row" do
      input = ["toggle 0,0 through 999,0"]
      assert Day06.part1(input) == 1000
    end

    test "turn off middle section" do
      input = ["turn off 499,499 through 500,500"]
      assert Day06.part1(input) == 0
    end

    test "multiple instructions" do
      input = ["turn on 0,0 through 0,1", "toggle 0,0 through 0,1", "turn off 0,0 through 0,1"]
      assert Day06.part1(input) == 0
    end

    test "puzzle input" do
      input = Data.read_file_as_list_of_strings("data/day06.txt")
      assert Day06.part1(input) == 400_410
    end
  end

  describe "part2/1" do
    test "empty input returns 0" do
      assert Day06.part2([]) == 0
    end

    test "turn on all lights" do
      input = "turn on 0,0 through 999,999"
      assert Day06.part2([input]) == 1_000_000
    end

    test "toggle first row" do
      input = "toggle 0,0 through 999,0"
      assert Day06.part2([input]) == 2000
    end

    test "turn off middle section" do
      input = "turn off 499,499 through 500,500"
      assert Day06.part2([input]) == 0
    end

    test "multiple instructions" do
      input = [
        "turn on 0,0 through 0,1",
        "toggle 0,0 through 0,1",
        "turn off 0,0 through 0,1"
      ]

      assert Day06.part2(input) == 4
    end

    test "puzzle input" do
      input = Data.read_file_as_list_of_strings("data/day06.txt")
      assert Day06.part2(input) == 15_343_601
    end
  end

  describe "parse_instruction/1" do
    test "parses turn on instruction" do
      assert Day06.parse_instruction("turn on 0,0 through 999,999") ==
               {:on, {{0, 0}, {999, 999}}}
    end

    test "parses turn off instruction" do
      assert Day06.parse_instruction("turn off 499,499 through 500,500") ==
               {:off, {{499, 499}, {500, 500}}}
    end

    test "parses toggle instruction" do
      assert Day06.parse_instruction("toggle 0,0 through 999,0") ==
               {:toggle, {{0, 0}, {999, 0}}}
    end
  end
end
