defmodule Day03Test do
  use ExUnit.Case

  describe "part1" do
    test "empty input" do
      assert Day03.part1(Data.string_as_charlist("")) == 1 
    end

    test ">" do
      assert Day03.part1(Data.string_as_charlist(">")) == 2
    end

    test "^>v<" do
      assert Day03.part1(Data.string_as_charlist("^>v<")) == 4
    end

    test "^v^v^v^v^v" do
      assert Day03.part1(Data.string_as_charlist("^v^v^v^v^v")) == 2
    end

    test "puzzle from file" do
      assert Day03.part1(Data.read_file_as_charlist("data/day03.txt")) == 2592
    end
  end
end
