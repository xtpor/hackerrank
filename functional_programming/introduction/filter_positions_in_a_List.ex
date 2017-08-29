
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
    |> list_to_string
    |> IO.puts
  end

  def main(input) do
    input
    |> Enum.with_index
    |> Enum.filter(fn {_, index} -> Integer.is_odd(index) end)
    |> Enum.map(fn {value, _} -> value end)
  end

end

Solution.run
