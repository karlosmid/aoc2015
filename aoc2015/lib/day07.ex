defmodule Day07 do
  import Bitwise

  def run(input) do
    instructions =
      input
      |> Enum.map(&Day07Parser.parse_instruction/1)
      |> Enum.map(fn {:ok, [parsed], _, _, _, _} -> parsed end)
      |> Enum.into(%{})

    {result, _cache} = evaluate("a", instructions, %{})
    result
  end

  defp evaluate(x, _instructions, cache) when is_integer(x), do: {x, cache}

  defp evaluate(x, instructions, cache) when is_binary(x) do
    case Integer.parse(x) do
      {int, ""} ->
        {int, cache}

      _ ->
        case Map.fetch(cache, x) do
          {:ok, val} ->
            {val, cache}

          :error ->
            {val, cache1} = eval_expr(Map.get(instructions, x), instructions, cache)
            result = rem(val + 65536, 65536)

            {result, Map.put(cache1, x, result)}
        end
    end
  end

  defp eval_expr({:value, x}, instructions, cache), do: evaluate(x, instructions, cache)

  defp eval_expr({:not, x}, instructions, cache) do
    {val, cache} = evaluate(x, instructions, cache)
    {bnot(val), cache}
  end

  defp eval_expr({:and, x, y}, instructions, cache) do
    {v1, cache} = evaluate(x, instructions, cache)
    {v2, cache} = evaluate(y, instructions, cache)
    {v1 &&& v2, cache}
  end

  defp eval_expr({:or, x, y}, instructions, cache) do
    {v1, cache} = evaluate(x, instructions, cache)
    {v2, cache} = evaluate(y, instructions, cache)
    {v1 ||| v2, cache}
  end

  defp eval_expr({:lshift, x, y}, instructions, cache) do
    {v1, cache} = evaluate(x, instructions, cache)
    {v2, cache} = evaluate(y, instructions, cache)
    {v1 <<< v2, cache}
  end

  defp eval_expr({:rshift, x, y}, instructions, cache) do
    {v1, cache} = evaluate(x, instructions, cache)
    {v2, cache} = evaluate(y, instructions, cache)
    {v1 >>> v2, cache}
  end
end
