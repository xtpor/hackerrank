
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
    input
    |> Enum.filter(&Integer.is_odd/1)
    |> Enum.sum
  end

end

Solution.run
