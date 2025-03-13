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

end
