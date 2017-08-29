
defmodule Solution do

  def list_to_string(list) do
    list
    |> Enum.join("\n")
  end

  def string_to_list(string) do
    string
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def run do
    IO.gets("")
    |> string_to_list
    |> main
    |> format
    |> IO.puts
  end

  def format(list) do
    "[" <> Enum.join(list, ", ") <> "]"
  end

  def main([length]) do
    for _ <- 0..(length - 1), do: 1
  end

  def main([0]) do
    []
  end

end

Solution.run
