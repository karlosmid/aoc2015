defmodule Day07Test do
  use ExUnit.Case, async: true

  alias Day07

  describe "evaluate circuit logic" do
    test "simple direct assignment" do
      input = """
      123 -> x
      x -> a
      """

      assert Day07.run(input) == 123
    end

    test "AND operation" do
      input = """
      123 -> x
      456 -> y
      x AND y -> d
      d -> a
      """

      assert Day07.run(input) == 72
    end

    test "OR operation" do
      input = """
      123 -> x
      456 -> y
      x OR y -> e
      """

      assert Day07.run(input <> "\ne -> a") == 507
    end

    test "LSHIFT operation" do
      input = """
      123 -> x
      x LSHIFT 2 -> f
      """

      assert Day07.run(input <> "\nf -> a") == 492
    end

    test "RSHIFT operation" do
      input = """
      456 -> y
      y RSHIFT 2 -> g
      """

      assert Day07.run(input <> "\ng -> a") == 114
    end

    test "NOT operation" do
      input = """
      123 -> x
      NOT x -> h
      """

      assert Day07.run(input <> "\nh -> a") == 65412
    end

    test "chained dependencies" do
      input = """
      123 -> x
      x -> y
      y -> z
      z -> a
      """

      assert Day07.run(input) == 123
    end

    test "example from AoC Day 7 description" do
      input = """
      123 -> x
      456 -> y
      x AND y -> d
      x OR y -> e
      x LSHIFT 2 -> f
      y RSHIFT 2 -> g
      NOT x -> h
      NOT y -> i
      d -> a
      """

      assert Day07.run(input) == 72
    end
  end
end
