
defmodule Solution do

  def solve(_, i, n) when i == n - 1, do: 0
  def solve(_, i, n) when i == n - 2, do: 1

  def solve(clouds, i, n) when elem(clouds, i + 2) == 1 do
    1 + solve(clouds, i + 1, n)
  end

  def solve(clouds, i, n) do
    1 + solve(clouds, i + 2, n)
  end

  def run do
    [n] = read_integers()
    clouds = read_integers() |> List.to_tuple

    solve(clouds, 0, n)
    |> IO.puts
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
