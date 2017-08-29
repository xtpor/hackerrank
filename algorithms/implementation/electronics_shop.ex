
defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def run do
    [k, _n, _m] = read_integers()
    keyboards = read_integers()
    usbs = read_integers()

    items = for i <- keyboards, j <- usbs, i + j <= k, do: {i, j}

    case items do
      [] -> -1
      _ ->
        items
        |> Enum.map(fn {i, j} -> i + j end)
        |> Enum.max
    end
    |> IO.puts
  end

end

Solution.run
