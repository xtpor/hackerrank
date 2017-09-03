
defmodule Solution do

  def all_squares do
    [
      [8, 1, 6,
       3, 5, 7,
       4, 9, 2],

      [6, 1, 8,
       7, 5, 3,
       2, 9, 4],

      [4, 9, 2,
       3, 5, 7,
       8, 1, 6],

      [2, 9, 4,
       7, 5, 3,
       6, 1, 8],

      [8, 3, 4,
       1, 5, 9,
       6, 7, 2],

      [4, 3, 8,
       9, 5, 1,
       2, 7, 6],

      [6, 7, 2,
       1, 5, 9,
       8, 3, 4],

      [2, 7, 6,
       9, 5, 1,
       4, 3, 8]
    ]
  end

  def diff(sq1, sq2) do
    Enum.zip(sq1, sq2)
    |> Enum.map(fn {x1, x2} -> abs(x1 - x2) end)
    |> Enum.sum
  end

  def cost(sq1) do
    all_squares()
    |> Enum.map(fn sq2 -> diff(sq1, sq2) end)
    |> Enum.min
  end

  def run do
    [a, b, c] = read_integers()
    [d, e, f] = read_integers()
    [g, h, i] = read_integers()

    [a, b, c, d, e, f, g, h, i]
    |> cost
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
