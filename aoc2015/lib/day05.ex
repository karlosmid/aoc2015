defmodule Day05 do
  def part1(input) do
    part1(input, 0)
  end

  defp part1([], no_of_nice_words), do: no_of_nice_words

  defp part1([word | rest], no_of_nice_words) do
    if(nice_word?(word)) do
      part1(rest, no_of_nice_words + 1)
    else
      part1(rest, no_of_nice_words)
    end
  end

  defp nice_word?(word) do
    cond do
      String.contains?(word, ["ab", "cd", "pq", "xy"]) -> false
      check_vowles(String.to_charlist(word)) == true && check_double_letters(word) == true -> true
      true -> false
    end
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
end
