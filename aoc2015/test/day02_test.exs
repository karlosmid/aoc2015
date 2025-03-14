defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  describe "part1" do
    test "izračunava ukupnu površinu papira za jedan set dimenzija" do
      assert Day02.part1(["2x3x4"]) == 58
    end

    test "izračunava ukupnu površinu papira za više setova dimenzija" do
      assert Day02.part1(["2x3x4", "1x1x10"]) == 101
    end

    test "izračunava površinu za praznu listu" do
      assert Day02.part1([]) == 0
    end

    test "paper_area pravilno računa površinu i dodatak" do
      # Testiramo privatnu funkciju koristeći :erlang.apply/3
      result = Day02.paper_area("2x3x4")
      # 52 (površina) + 6 (najmanji dodatak)
      assert result == 58
    end

    test "puzzle from file" do
      assert Day02.part1(Data.read_file_as_list_of_strings("data/day02/day02.txt")) == 1_588_178
    end
  end

  describe "part2" do
    test "izračunava ukupnu dužinu trake za jedan set dimenzija" do
      assert Day02.part2(["2x3x4"]) == 34
    end

    test "puzzle from file" do
      assert Day02.part2(Data.read_file_as_list_of_strings("data/day02/day02.txt")) == 3_783_758
    end
  end
end
