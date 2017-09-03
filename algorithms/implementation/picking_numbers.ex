
import Enum

defmodule Solution do

  def run do
    _ = read_integers()
    read_integers()
    |> count_numbers
    |> accumulate
    |> Enum.max
    |> IO.puts
  end

  def count_numbers(numbers) do
    reduce numbers, %{}, fn x, acc ->
      Map.update(acc, x, 1, &(&1 + 1))
    end
  end

  def accumulate(counter) do
    map 1..99, fn i ->
      Map.get(counter, i, 0) + Map.get(counter, i + 1, 0)
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
