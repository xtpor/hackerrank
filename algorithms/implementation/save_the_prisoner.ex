
defmodule Solution do

  def solve(n, m, s) do
    rem((s - 1) + (m - 1), n) + 1
  end

  def run do
    [n] = read_integers()
    for _ <- 0..(n - 1) do
      [n, m, s] = read_integers()
      solve(n, m, s)
      |> IO.puts
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
