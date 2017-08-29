
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

  def replicate([n | list]) do
    Enum.flat_map list, fn c -> repeat(n, c) end
  end

  def repeat(0, _), do: []
  def repeat(n, c), do: [c | repeat(n - 1, c)]

  def run do
    IO.read(:all)
    |> string_to_list
    |> replicate
    |> list_to_string
    |> IO.puts
  end

end

Solution.run
