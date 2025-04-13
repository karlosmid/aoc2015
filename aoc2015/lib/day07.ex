defmodule Day07 do
  import Bitwise

  def run(input) do
    instructions =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&Day07Parser.parse_instruction/1)
      |> Enum.map(fn {:ok, [parsed], _, _, _, _} -> parsed end)
      |> Enum.into(%{})

    evaluate("a", instructions, %{})
  end

  defp evaluate(x, _instructions, _cache) when is_integer(x), do: x

  defp evaluate(x, instructions, cache) when is_binary(x) do
    case Integer.parse(x) do
      {int, ""} ->
        int

      _ ->
        case Map.fetch(cache, x) do
          {:ok, val} ->
            val

          :error ->
            val = eval_expr(Map.get(instructions, x), instructions, cache)
            result = rem(val + 65536, 65536)

            Map.put(cache, x, result)
            # recurse with updated cache
            |> then(&evaluate(x, instructions, &1))
        end
    end
  end

  defp eval_expr({:value, x}, instructions, cache), do: evaluate(x, instructions, cache)
  defp eval_expr({:not, x}, instructions, cache), do: bnot(evaluate(x, instructions, cache))

  defp eval_expr({:and, x, y}, instructions, cache),
    do: evaluate(x, instructions, cache) &&& evaluate(y, instructions, cache)

  defp eval_expr({:or, x, y}, instructions, cache),
    do: evaluate(x, instructions, cache) ||| evaluate(y, instructions, cache)

  defp eval_expr({:lshift, x, y}, instructions, cache),
    do: evaluate(x, instructions, cache) <<< evaluate(y, instructions, cache)

  defp eval_expr({:rshift, x, y}, instructions, cache),
    do: evaluate(x, instructions, cache) >>> evaluate(y, instructions, cache)
end
