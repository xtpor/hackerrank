
require Integer

defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def from_front(_, i), do: div(i, 2)

  def from_back(n, i) when Integer.is_odd(n), do: div(n - i, 2)
  def from_back(n, i), do: div(n - i + 1, 2)

  def solve(n, i) do
    min(from_front(n, i), from_back(n, i))
  end

  def run do
    [n] = read_integers()
    [i] = read_integers()
    IO.puts solve(n, i)
  end

end

Solution.run
