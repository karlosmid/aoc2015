defmodule Day04 do
  def part1(input) do
    part1(input, 1, calc_hash(input, 1))
  end

  defp part1(input, n, hash) do
    if String.starts_with?(hash, "00000") do
      n
    else
      part1(input, n + 1, calc_hash(input, n + 1))
    end
  end

  def part2(input, start_n \\ 1) do
    part2(input, start_n, calc_hash(input, start_n))
  end

  defp part2(input, n, hash) do
    if String.starts_with?(hash, "000000") do
      n
    else
      part2(input, n + 1, calc_hash(input, n + 1))
    end
  end

  defp calc_hash(input, n) do
    Base.encode16(:crypto.hash(:md5, input <> Integer.to_string(n)), case: :lower)
  end
end
