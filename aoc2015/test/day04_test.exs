defmodule Day04Test do
  use ExUnit.Case

  describe "part1/1" do
    test "abcdef" do
      assert Day04.part1("abcdef") == 609_043
    end

    test "pqrstuv" do
      assert Day04.part1("pqrstuv") == 1_048_970
    end

    test "iwrupvqb" do
      assert Day04.part1("iwrupvqb") == 3_463_86
    end
  end

  describe "part2/1" do
    test "iwrupvqb" do
      assert Day04.part2("iwrupvqb") == 9_958_218
    end
  end
end
