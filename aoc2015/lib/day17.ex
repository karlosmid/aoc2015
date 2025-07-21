defmodule Day17 do
  def combinations(list, n) do
    case n do
      2 ->
        for i <- list, j <- list -- [i], i + j == 150, do: {i, j}

      3 ->
        for i <- list, j <- list -- [i], k <- list -- [i, j], i + j + k == 150, do: {i, j, k}

      4 ->
        for i <- list,
            j <- list -- [i],
            k <- list -- [i, j],
            l <- list -- [i, j, k],
            i + j + k + l == 150,
            do: {i, j, k, l}

      5 ->
        for i <- list,
            j <- list -- [i],
            k <- list -- [i, j],
            l <- list -- [i, j, k],
            m <- list -- [i, j, k, l],
            i + j + k + l + m == 150,
            do: {i, j, k, l, m}

      6 ->
        for i <- list,
            j <- list -- [i],
            k <- list -- [i, j],
            l <- list -- [i, j, k],
            m <- list -- [i, j, k, l],
            n <- list -- [i, j, k, l, m],
            i + j + k + l + m + n == 150,
            do: {i, j, k, l, m, n}

      7 ->
        for i <- list,
            j <- list -- [i],
            k <- list -- [i, j],
            l <- list -- [i, j, k],
            m <- list -- [i, j, k, l],
            n <- list -- [i, j, k, l, m],
            o <- list -- [i, j, k, l, m, n],
            i + j + k + l + m + n + o == 150,
            do: {i, j, k, l, m, n, o}
    end
  end

  def combinations_without_repetition(list, n) do
    cond do
      n == 0 ->
        [[]]

      length(list) < n ->
        []

      true ->
        [head | tail] = list

        for(subset <- combinations_without_repetition(tail, n - 1), do: [head | subset]) ++
          combinations_without_repetition(tail, n)
    end
  end

  def part1(list) do
    1..length(list)
    |> Enum.map(fn n ->
      combinations_without_repetition(list, n)
      |> Enum.filter(fn x -> Enum.sum(x) == 150 end)
      |> Enum.count()
    end)
    |> Enum.sum()
  end

  def part2(list) do
    1..length(list)
    |> Enum.reduce_while(0, fn n, _acc ->
      combinations =
        combinations_without_repetition(list, n)
        |> Enum.filter(fn x -> Enum.sum(x) == 150 end)
        |> Enum.count()

      if combinations != 0 do
        {:halt, {combinations, n}}
      else
        {:cont, {combinations, n}}
      end
    end)
  end
end
