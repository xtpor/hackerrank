
defmodule Solution do

  def func(seq) do
    fn x -> elem(seq, x - 1) end
  end

  def run do
    [n] = read_integers()
    f =
      read_integers()
      |> List.to_tuple
      |> func

    1..n
    |> Enum.map(fn i ->
      find_y(f, n, i)
      |> IO.puts
    end)
  end

  def find_y(f, n, x) do
    1..n
    |> Enum.filter(fn i -> f.(f.(i)) == x end)
    |> Enum.at(0)
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
