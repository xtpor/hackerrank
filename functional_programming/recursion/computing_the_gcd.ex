
defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def gcd(a, b) when b != 0, do: gcd(b, rem(a, b))
  def gcd(a, _), do: a

  def run do
    [a, b] = read_integers()

    gcd(a, b)
    |> IO.puts
  end

end

Solution.run
