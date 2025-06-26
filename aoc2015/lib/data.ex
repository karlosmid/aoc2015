defmodule Data do
  def read_file_as_charlist(path) do
    path
    |> File.stream!([], 1)
    |> Enum.join()
    |> string_as_charlist()
  end

  def string_as_charlist(string) do
    string
    |> String.to_charlist()
  end

  def read_file_as_list_of_strings(path) do
    path
    |> File.stream!([], :line)
    |> Enum.map(&String.trim/1)
  end

  def read_file(path) do
    path
    |> File.stream!([], :line)
    |> Enum.join()
  end

  def permutations([]), do: [[]]

  def permutations(list) do
    for x <- list, rest <- permutations(list -- [x]), do: [x | rest]
  end

  def pairs(routes) do
    routes
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [start, stop] ->
      {start, stop}
    end)
  end
end
