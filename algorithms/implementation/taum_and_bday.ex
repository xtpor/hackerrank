
defmodule Solution do

  def solve(b, w, x, y, z) do
    Enum.min([x * b + y * w,
              x * (b + w) + z * w,
              y * (b + w) + z * b])
  end

  def run do
    [n] = read_integers()
    for _ <- 1..n do
      [b, w] = read_integers()
      [x, y, z] = read_integers()

      IO.puts solve(b, w, x, y, z)
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
