defmodule Day14Test do
  use ExUnit.Case

  test "parse" do
    input = [
      "Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.",
      "Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."
    ]

    assert Day14.parse(input) == [
             %{name: "Comet", speed: 14, duration: 10, rest: 127},
             %{name: "Dancer", speed: 16, duration: 11, rest: 162}
           ]
  end

  test "distance" do
    assert Day14.distance(14, 10, 127, 2503) == 2660
    assert Day14.distance(14, 10, 127, 1) == 14
  end

  test "part1 example" do
    input = [
      "Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.",
      "Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."
    ]

    assert Day14.part1(input, 1000) == %{name: "Comet", distance: 1120}
  end

  test "part1" do
    input = Data.read_file_as_list_of_strings("data/day14.txt")

    assert Day14.part1(input, 2503) == %{name: "Cupid", distance: 2696}
  end

  test "part2" do
    input = Data.read_file_as_list_of_strings("data/day14.txt")
    assert Day14.part2(input, 2503) == %{distance: 2640, name: "Rudolph", duration: 8, points: 1084, rest: 165, speed: 22}
  end

  test "part2 example" do
    input = [
      "Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.",
      "Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."
    ]

    assert Day14.part2(input, 1000) == %{distance: 1056, name: "Dancer", duration: 11, points: 689, rest: 162, speed: 16}
  end
end
