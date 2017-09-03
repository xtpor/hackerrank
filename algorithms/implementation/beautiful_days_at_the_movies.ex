
defmodule Solution do

  def reversal(n) do
    n
    |> Integer.to_charlist
    |> Enum.reverse
    |> List.to_integer
  end

  def beautiful?(n, k) do
    rem(n - reversal(n), k) == 0
  end

  def count_beautiful(i, j, _) when i > j, do: 0
  def count_beautiful(i, j, k) do
    case beautiful?(i, k) do
      true -> 1 + count_beautiful(i + 1, j, k)
      false -> 0 + count_beautiful(i + 1, j, k)
    end
  end

  def run do
    [i, j, k] = read_integers()
    count_beautiful(i, j, k)
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
