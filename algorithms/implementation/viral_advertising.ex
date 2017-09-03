
defmodule Solution do

  def count(1), do: 2
  def count(day), do: div(count(day - 1) * 3, 2)

  def total(0), do: 0
  def total(n), do: total(n - 1) + count(n)

  def run do
    IO.gets("")
    |> String.trim
    |> String.to_integer
    |> total
    |> IO.puts
  end

end

Solution.run
