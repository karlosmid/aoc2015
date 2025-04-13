defmodule Day05Test do
  use ExUnit.Case

  describe "part1/1" do
    test "empty list returns 0" do
      assert Day05.part1([]) == 0
    end

    test "list with one nice word returns 1" do
      assert Day05.part1(["aaa"]) == 1
    end

    test "list with one not nice word returns 0" do
      assert Day05.part1(["cat"]) == 0
    end

    test "list with mixed words counts only nice words" do
      assert Day05.part1(["aaa", "cat", "eee", "dog"]) == 2
    end

    test "ugknbfddgicrmopn is nice" do
      assert Day05.part1(["ugknbfddgicrmopn"]) == 1
    end

    test "aaa is nice" do
      assert Day05.part1(["aaa"]) == 1
    end

    test "jchzalrnumimnmhp is not nice" do
      assert Day05.part1(["jchzalrnumimnmhp"]) == 0
    end

    test "haegwjzuvuyypxyu is not nice" do
      assert Day05.part1(["haegwjzuvuyypxyu"]) == 0
    end

    test "dvszwmarrgswjxmb is not nice" do
      assert Day05.part1(["dvszwmarrgswjxmb"]) == 0
    end

    test "example from puzzle" do
      input = [
        "ugknbfddgicrmopn",
        "aaa",
        "jchzalrnumimnmhp",
        "haegwjzuvuyypxyu",
        "dvszwmarrgswjxmb"
      ]

      assert Day05.part1(input) == 2
    end

    test "puzzle input" do
      input = Data.read_file_as_list_of_strings("data/day05.txt")
      assert Day05.part1(input) == 258
    end
  end

  describe "part2/1" do
    test "empty list returns 0" do
      assert Day05.part2([]) == 0
    end

    test "qjhvhtzxzqqjkmpb is nice" do
      assert Day05.part2(["qjhvhtzxzqqjkmpb"]) == 1
    end

    test "xxyxx is nice" do
      assert Day05.part2(["xxyxx"]) == 1
    end

    test "uurcxstgmygtbstg is not nice" do
      assert Day05.part2(["uurcxstgmygtbstg"]) == 0
    end

    test "ieodomkazucvgmuy is not nice" do
      assert Day05.part2(["ieodomkazucvgmuy"]) == 0
    end

    test "example from puzzle" do
      input = [
        "qjhvhtzxzqqjkmpb",
        "xxyxx",
        "uurcxstgmygtbstg",
        "ieodomkazucvgmuy"
      ]

      assert Day05.part2(input) == 2
    end

    test "puzzle input" do
      input = Data.read_file_as_list_of_strings("data/day05.txt")
      assert Day05.part2(input) == 53
    end
  end
end
