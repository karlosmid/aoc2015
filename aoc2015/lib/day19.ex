defmodule Day19 do
  def parse(input) do
    Enum.map(input, fn line ->
      case Regex.run(~r/((\w+) => (\w+)|(\w+)|\\n*)/, line) do
        [_, _, from, to] -> {from, to}
        nil -> nil
        [_, _, _, _, medicine_molecule] -> medicine_molecule
      end
    end)
    |> Enum.filter(& &1)
  end

  def replace_nth_occurrence(string, pattern, replacement, n) do
    regex = ~r/#{pattern}/
    parts = Regex.split(regex, string, include_captures: true)

    replace_occurrence(parts, pattern, replacement, n)
    |> Enum.join()
  end

  defp replace_occurrence(parts, pattern, replacement, n) do
    do_replace(parts, pattern, replacement, n, 0)
  end

  defp do_replace([], _pattern, _replacement, _target, _count), do: []

  defp do_replace([head | tail], pattern, replacement, target, count) do
    if Regex.match?(~r/^#{pattern}$/, head) do
      new_count = count + 1
      replaced = if new_count == target, do: replacement, else: head
      [replaced | do_replace(tail, pattern, replacement, target, new_count)]
    else
      [head | do_replace(tail, pattern, replacement, target, count)]
    end
  end

  def number_of_occurences(pattern, string) do
    Regex.split(~r/#{pattern}/, string, include_captures: true)
    |> Enum.filter(fn x -> x == pattern end)
    |> Enum.count()
  end

  def part1(input) do
    start = Enum.at(input, -1)
    replacements = Enum.slice(input, 0..-2//1)

    do_replacements(replacements, start)
    |> Enum.uniq()
    |> Enum.count()
  end

  def do_replacements(replacements, start) do
    Enum.map(replacements, fn {from, to} ->
      n =
        number_of_occurences(from, start)

      Enum.map(1..n//1, &replace_nth_occurrence(start, from, to, &1))
    end)
    |> Enum.concat()
  end

  def part2(input, start) do
    stop = Enum.at(input, -1)
    replacements = Enum.slice(input, 0..-2//1)
    go_part2(replacements, stop, start, 1)
  end

  defp go_part2(replacements, stop, start, step) do
    if String.length(start) <= String.length(stop) do
      replaced =
        do_replacements(replacements, start)
        |> List.flatten()
        |> Enum.uniq()
        |> IO.inspect(label: :replaced)

      replaced
      |> Enum.filter(fn to -> to == stop end)
      |> case do
        [] -> Enum.map(replaced, fn start -> go_part2(replacements, stop, start, step + 1) end)
        _ -> step
      end
    else
      []
    end
  end
end
