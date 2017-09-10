
import Enum

defmodule Solution do

  def pascal(1), do: [1]
  def pascal(n) do
    p = pascal(n - 1)
    zip(p ++ [0], [0] ++ p)
    |> map(fn {i, j} -> i + j end)
  end

  def run do
    n = IO.gets("") |> String.trim |> String.to_integer

    for i <- 1..n do
      pascal(i)
      |> Enum.join(" ")
      |> IO.puts
    end
  end

end

Solution.run
