
defmodule Solution do

  def solve(a, b) do
    low = a |> :math.sqrt |> Float.ceil
    high = b |> :math.sqrt |> Float.floor
    high - low + 1 |> trunc
  end

  def run do
    [n] = read_integers()
    for _ <- 0..n - 1 do
      [a, b] = read_integers()
      IO.puts solve(a, b)
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
