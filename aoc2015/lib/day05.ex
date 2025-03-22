defmodule Day05 do
  def part1(input), do: part(input, &nice_word?/1)

  def part2(input), do: part(input, &nice_word_two?/1)

  def part(input, nice_word_fn) do
    part(input, nice_word_fn, 0)
  end

  defp part([], _nice_word_fn, no_of_nice_words), do: no_of_nice_words

  defp part([word | rest], nice_word_fn, no_of_nice_words) do
    if(nice_word_fn.(word)) do
      part(rest, nice_word_fn, no_of_nice_words + 1)
    else
      part(rest, nice_word_fn, no_of_nice_words)
    end
  end

  def nice_word?(word) do
    cond do
      String.contains?(word, ["ab", "cd", "pq", "xy"]) -> false
      check_vowles(String.to_charlist(word)) == true && check_double_letters(word) == true -> true
      true -> false
    end
  end
  
  def nice_word_two?(word) do
      check_pair_letters(word) == true and check_symetric_letters(word) == true
  end

  defp check_vowles(vowles) do
    check_vowles(vowles, 0)
  end

  defp check_vowles([], no_of_vowles), do: no_of_vowles > 2
  defp check_vowles([?a | _rest], no_of_vowles) when no_of_vowles > 2, do: true
  defp check_vowles([?a | rest], no_of_vowles), do: check_vowles(rest, no_of_vowles + 1)
  defp check_vowles([?e | _rest], no_of_vowles) when no_of_vowles > 2, do: true
  defp check_vowles([?e | rest], no_of_vowles), do: check_vowles(rest, no_of_vowles + 1)
  defp check_vowles([?i | _rest], no_of_vowles) when no_of_vowles > 2, do: true
  defp check_vowles([?i | rest], no_of_vowles), do: check_vowles(rest, no_of_vowles + 1)
  defp check_vowles([?o | _rest], no_of_vowles) when no_of_vowles > 2, do: true
  defp check_vowles([?o | rest], no_of_vowles), do: check_vowles(rest, no_of_vowles + 1)
  defp check_vowles([?u | _rest], no_of_vowles) when no_of_vowles > 2, do: true
  defp check_vowles([?u | rest], no_of_vowles), do: check_vowles(rest, no_of_vowles + 1)
  defp check_vowles([_ | rest], no_of_vowles), do: check_vowles(rest, no_of_vowles)

  defp check_double_letters(word) do
    String.match?(word, ~r/(.)\1/)
  end

  defp check_pair_letters(word),
    do: String.match?(word, ~r/([a-zA-Z])([a-zA-Z])(?!\1\1|\2\2).*?\1\2/)

  defp check_symetric_letters(word), do: String.match?(word, ~r/([a-zA-Z])([a-zA-Z])\1/)
end
