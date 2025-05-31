defmodule Day11 do
  @next_letter %{
    "a" => "b",
    "b" => "c",
    "c" => "d",
    "d" => "e",
    "e" => "f",
    "f" => "g",
    "g" => "h",
    "h" => "i",
    "i" => "j",
    "j" => "k",
    "k" => "l",
    "l" => "m",
    "m" => "n",
    "n" => "o",
    "o" => "p",
    "p" => "q",
    "q" => "r",
    "r" => "s",
    "s" => "t",
    "t" => "u",
    "u" => "v",
    "v" => "w",
    "w" => "x",
    "x" => "y",
    "y" => "z",
    "z" => "a"
  }

  def string_to_list(string) do
    String.split(string, "", trim: true)
  end

  def increment([letter]), do: [@next_letter[letter]]

  def increment(string) do
    @next_letter[List.last(string)]
    |> case do
      "a" ->
        increment(Enum.slice(string, 0..-2//1)) ++ ["a"]

      next_letter ->
        List.replace_at(string, -1, next_letter)
    end
  end

  def has_consecutive_letters?(string) do
    string
    |> Enum.join()
    |> String.match?(
      ~r/abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz/
    )
  end

  def has_forbidden_letters?(string) do
    string
    |> Enum.join()
    |> String.match?(~r/[iol]/)
  end

  def has_two_pairs?(string) do
    string
    |> Enum.join()
    |> String.match?(~r/(.)\1(?!\1).*(.)\2/)
  end

  def part1(input) do
    string =
      input
      |> string_to_list()

    do_part1(string)
  end

  def do_part1(string) do
    string = increment(string)

    if has_consecutive_letters?(string) and not has_forbidden_letters?(string) and
         has_two_pairs?(string) do
      Enum.join(string)
    else
      do_part1(string)
    end
  end
end
