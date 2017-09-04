
defmodule Solution do

  def fac(0), do: 1
  def fac(n), do: n * fac(n - 1)

  def run do
    [n] = read_integers()
    IO.puts fac(n)
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
