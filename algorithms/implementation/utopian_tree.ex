
require Integer

defmodule Solution do

  def run do
    n = read_integer()
    for _ <- 0..(n - 1) do
      read_integer()
      |> growth_cycle
      |> IO.puts
    end
  end

  def growth_cycle(0), do: 1
  def growth_cycle(n) when Integer.is_odd(n), do: growth_cycle(n - 1) * 2
  def growth_cycle(n) when Integer.is_even(n), do: growth_cycle(n - 1) + 1

  def read_integer do
    IO.gets("")
    |> String.trim
    |> String.to_integer
  end

end

Solution.run
