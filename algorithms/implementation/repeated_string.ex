
defmodule Solution do

  def count_a(string) do
    string
    |> Enum.filter(&(&1 == ?a))
    |> Enum.count
  end

  def solve(string, n) do
    len = length(string)
    num_a = count_a(string)

    div(n, len) * num_a + (string |> Enum.take(rem(n, len)) |> count_a)
  end

  def run do
    string = IO.gets("") |> String.trim |> to_charlist
    n = IO.gets("") |> String.trim |> String.to_integer

    IO.puts solve(string, n)
  end

end

Solution.run
