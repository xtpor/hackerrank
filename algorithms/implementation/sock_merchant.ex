
defmodule Solution do
  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def group_socks(socks) do
    Enum.reduce socks, %{}, fn s, acc ->
      Map.update acc, s, 1, &(&1 + 1)
    end
  end

  def num_sold(socks_group) do
    socks_group
    |> Enum.map(fn {_, num} -> div num, 2 end)
    |> Enum.sum
  end

  def run do
    [_n] = read_integers()
    read_integers()
    |> group_socks
    |> num_sold
    |> IO.puts
  end
end

Solution.run
