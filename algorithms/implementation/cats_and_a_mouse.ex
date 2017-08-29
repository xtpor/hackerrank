
defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def solve([cat_a, cat_b, mouse]) do
    da = abs(cat_a - mouse)
    db = abs(cat_b - mouse)
    cond do
      da < db -> "Cat A"
      da > db -> "Cat B"
      da == db -> "Mouse C"
    end
  end

  def run do
    [n] = read_integers()
    for _ <- 0..(n-1) do
      read_integers()
      |> solve
      |> IO.puts
    end
  end

end

Solution.run
