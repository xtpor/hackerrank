
defmodule Solution do

  def prem(a, b) do
    rem(rem(a, b) + b, b)
  end

  def index(n, k, q) do
    prem(q - k, n)
  end

  def solve(array, n, k, q) do
    elem(array, index(n, k, q))
  end

  def run do
    [n, k, cases] = read_integers()
    numbers = read_integers() |> List.to_tuple
    for _ <- 0..(cases - 1) do
      [q] = read_integers()
      IO.puts solve(numbers, n, k, q)
    end
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
