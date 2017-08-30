
defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def distance({{x1, y1}, {x2, y2}}) do
    import :math
    sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
  end

  def run do
    [n] = read_integers()

    points = for _ <- 0..(n - 1) do
      read_integers()
      |> List.to_tuple
    end

    Enum.zip(points, tl(points) ++ [hd(points)])
    |> Enum.map(&distance/1)
    |> Enum.sum
    |> IO.puts
  end

end

Solution.run
