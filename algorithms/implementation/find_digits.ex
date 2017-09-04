
import Enum

defmodule Solution do

  def digits(num) do
    num
    |> Integer.to_charlist
    |> map(&(&1 - ?0))
    |> filter(&(&1 != 0))
  end

  def count_divisible(num) do
    num
    |> digits
    |> filter(&(rem(num, &1) == 0))
    |> count
  end

  def run do
    [cases] = read_integers()
    for _ <- 0..(cases - 1) do
      [x] = read_integers()
      IO.puts count_divisible(x)
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
