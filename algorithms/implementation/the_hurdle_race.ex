
defmodule Solution do

  def run do
    [_, k] = read_integers()
    hurdles = read_integers()

    IO.puts max(0, Enum.max(hurdles) - k)
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
