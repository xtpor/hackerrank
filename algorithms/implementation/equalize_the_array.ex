
defmodule Solution do

  def solve(numbers) do
    {_, frequent_elems} =
      numbers
      |> Enum.group_by(&(&1))
      |> Enum.max_by(fn {_, n} -> length(n) end)

    length(numbers) - length(frequent_elems)
  end

  def run do
    _ = read_integers()

    read_integers()
    |> solve
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
