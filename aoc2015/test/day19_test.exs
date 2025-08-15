defmodule Day19Test do
  use ExUnit.Case

  test "parse" do
    assert Data.read_file_as_list_of_strings("data/day19.txt")
           |> Day19.parse()
           |> Enum.at(0) ==
             {"Al", "ThF"}
  end

  test "replace_nth_occurrence" do
    assert Day19.replace_nth_occurrence("abc", "b", "d", 1) == "adc"
    assert Day19.replace_nth_occurrence("abcb", "b", "d", 2) == "abcd"
    assert Day19.replace_nth_occurrence("abcbfb", "b", "d", 3) == "abcbfd"
    assert Day19.replace_nth_occurrence("HOH", "H", "HO", 1) == "HOOH"
  end

  test "replace_nth_occurrence_with_multiple_occurrences" do
    assert Day19.number_of_occurences(
             "Ca",
             "CRnCaCaCaSiRnBPTiMgArSiRnSiRnMgArSiRnCaFArTiTiBSiThFYCaFArCaCaSiThCaPBSiThSiThCaCaPTiRnPBSiThRnFArArCaCaSiThCaSiThSiRnMgArCaPTiBPRnFArSiThCaSiRnFArBCaSiRnCaPRnFArPMgYCaFArCaPTiTiTiBPBSiThCaPTiBPBSiRnFArBPBSiRnCaFArBPRnSiRnFArRnSiRnBFArCaFArCaCaCaSiThSiThCaCaPBPTiTiRnFArCaPTiBSiAlArPBCaCaCaCaCaSiRnMgArCaSiThFArThCaSiThCaSiRnCaFYCaSiRnFYFArFArCaSiRnFYFArCaSiRnBPMgArSiThPRnFArCaSiRnFArTiRnSiRnFYFArCaSiRnBFArCaSiRnTiMgArSiThCaSiThCaFArPRnFArSiRnFArTiTiTiTiBCaCaSiRnCaCaFYFArSiThCaPTiBPTiBCaSiThSiRnMgArCaF"
           ) == 52

    result =
      Day19.replace_nth_occurrence(
        "CRnCaCaCaSiRnBPTiMgArSiRnSiRnMgArSiRnCaFArTiTiBSiThFYCaFArCaCaSiThCaPBSiThSiThCaCaPTiRnPBSiThRnFArArCaCaSiThCaSiThSiRnMgArCaPTiBPRnFArSiThCaSiRnFArBCaSiRnCaPRnFArPMgYCaFArCaPTiTiTiBPBSiThCaPTiBPBSiRnFArBPBSiRnCaFArBPRnSiRnFArRnSiRnBFArCaFArCaCaCaSiThSiThCaCaPBPTiTiRnFArCaPTiBSiAlArPBCaCaCaCaCaSiRnMgArCaSiThFArThCaSiThCaSiRnCaFYCaSiRnFYFArFArCaSiRnFYFArCaSiRnBPMgArSiThPRnFArCaSiRnFArTiRnSiRnFYFArCaSiRnBFArCaSiRnTiMgArSiThCaSiThCaFArPRnFArSiRnFArTiTiTiTiBCaCaSiRnCaCaFYFArSiThCaPTiBPTiBCaSiThSiRnMgArCaF",
        "Ca",
        "CaCa",
        2
      )

    assert Day19.number_of_occurences("Ca", result) == 53
  end

  test "number of occurences" do
    assert Day19.number_of_occurences("b", "abc") == 1
    assert Day19.number_of_occurences("b", "abcb") == 2
    assert Day19.number_of_occurences("b", "abcbfb") == 3

    assert Day19.number_of_occurences(
             "Ca",
             "CRnCaCaCaSiRnBPTiMgArSiRnSiRnMgArSiRnCaFArTiTiBSiThFYCaFArCaCaSiThCaPBSiThSiThCaCaPTiRnPBSiThRnFArArCaCaSiThCaSiThSiRnMgArCaPTiBPRnFArSiThCaSiRnFArBCaSiRnCaPRnFArPMgYCaFArCaPTiTiTiBPBSiThCaPTiBPBSiRnFArBPBSiRnCaFArBPRnSiRnFArRnSiRnBFArCaFArCaCaCaSiThSiThCaCaPBPTiTiRnFArCaPTiBSiAlArPBCaCaCaCaCaSiRnMgArCaSiThFArThCaSiThCaSiRnCaFYCaSiRnFYFArFArCaSiRnFYFArCaSiRnBPMgArSiThPRnFArCaSiRnFArTiRnSiRnFYFArCaSiRnBFArCaSiRnTiMgArSiThCaSiThCaFArPRnFArSiRnFArTiTiTiTiBCaCaSiRnCaCaFYFArSiThCaPTiBPTiBCaSiThSiRnMgArCaF"
           ) == 52
  end

  test "part1" do
    assert Day19.part1([{"H", "HO"}, {"H", "OH"}, {"O", "HH"}, "HOH"]) == 4
    assert Day19.part1([{"H", "HO"}, {"H", "OH"}, {"O", "HH"}, {"e", "NAl"}, "HOH"]) == 4
    assert Day19.part1([{"H", "HO"}, {"H", "OH"}, {"O", "HH"}, "HOHOHO"]) == 7
  end

  test "part1 just e" do
    assert Day19.part1([
             {"e", "HF"},
             {"e", "NAl"},
             {"e", "OMg"},
             "CRnCaCaCaSiRnBPTiMgArSiRnSiRnMgArSiRnCaFArTiTiBSiThFYCaFArCaCaSiThCaPBSiThSiThCaCaPTiRnPBSiThRnFArArCaCaSiThCaSiThSiRnMgArCaPTiBPRnFArSiThCaSiRnFArBCaSiRnCaPRnFArPMgYCaFArCaPTiTiTiBPBSiThCaPTiBPBSiRnFArBPBSiRnCaFArBPRnSiRnFArRnSiRnBFArCaFArCaCaCaSiThSiThCaCaPBPTiTiRnFArCaPTiBSiAlArPBCaCaCaCaCaSiRnMgArCaSiThFArThCaSiThCaSiRnCaFYCaSiRnFYFArFArCaSiRnFYFArCaSiRnBPMgArSiThPRnFArCaSiRnFArTiRnSiRnFYFArCaSiRnBFArCaSiRnTiMgArSiThCaSiThCaFArPRnFArSiRnFArTiTiTiTiBCaCaSiRnCaCaFYFArSiThCaPTiBPTiBCaSiThSiRnMgArCaF"
           ]) == 0
  end

  test "part1 with datafile" do
    assert Day19.part1(Day19.parse(Data.read_file_as_list_of_strings("data/day19.txt"))) == 535
  end

  test "part2" do
    assert Day19.part2(
             [{"e", "H"}, {"e", "O"}, {"H", "HO"}, {"H", "OH"}, {"O", "HH"}, "HOH"],
             "e"
           )
           |> List.flatten()
           |> List.first() == 3

    assert Day19.part2(
             [{"e", "H"}, {"e", "O"}, {"H", "HO"}, {"H", "OH"}, {"O", "HH"}, "HOHOHO"],
             "e"
           )
           |> List.flatten()
           |> List.first() == 6
  end

  test "part2 with data file" do
    assert Day19.part2(
             Day19.parse(Data.read_file_as_list_of_strings("data/day19.txt")),
             "e"
           )
           |> List.flatten()
           |> List.first() == 3
  end
end
