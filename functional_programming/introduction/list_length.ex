
require Integer

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
    IO.read(:all)
    |> string_to_list
    |> main
    |> IO.puts
  end

  def main(input) do
    length_of(input)
  end

  def length_of([]), do: 0
  def length_of([_ | t]), do: 1 + length(t)

end

Solution.run
