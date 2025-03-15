defmodule Day01Test do
  use ExUnit.Case

  describe "part1" do
    test "empty input" do
      assert Day01.part1(Data.string_as_charlist("")) == 0
    end

    test "(((" do
      assert Day01.part1(Data.string_as_charlist("(((")) == 3
    end

    test "()(" do
      assert Day01.part1(Data.string_as_charlist("()(")) == 1
    end

    test "puzzle from file" do
      assert Day01.part1(Data.read_file_as_charlist("data/day01.txt")) == 232
    end
  end

  describe "part2" do
    test "empty input" do
      assert Day01.part2(Data.string_as_charlist("")) == "We never reached the basement"
    end

    test ")" do
      assert Day01.part2(Data.string_as_charlist(")")) == 1
    end

    test "(((" do
      assert Day01.part2(Data.string_as_charlist("(((")) == "We never reached the basement"
    end

    test "()())" do
      assert Day01.part2(Data.string_as_charlist("()())")) == 5
    end

    test "(()((((())))))))))))" do
      assert Day01.part2(Data.string_as_charlist("(()((((()))))))))))))")) == 15
    end

    test "puzzle from file" do
      assert Day01.part2(Data.read_file_as_charlist("data/day01.txt")) == 1783
    end
  end
end
