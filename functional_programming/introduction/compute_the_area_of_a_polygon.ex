
defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def run do
    [n] = read_integers()

    {xs, ys} = Enum.reduce 0..(n - 1), {[], []}, fn _, {xs, ys} ->
      [x, y] = read_integers()
      {[x | xs], [y | ys]}
    end

    xs = Enum.reverse(xs)
    ys = Enum.reverse(ys)

    positive =
      Enum.zip(xs, tl(ys) ++ [hd(ys)])
      |> Enum.map(fn {x, y} -> x * y end)
      |> Enum.sum

    negative =
      Enum.zip(ys, tl(xs) ++ [hd(xs)])
      |> Enum.map(fn {x, y} -> x * y end)
      |> Enum.sum

    IO.puts (positive - negative) / 2
  end

end

Solution.run
