
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do
  def actual_cost(items, k) do
    cost =
      for {val, i} <- Enum.with_index(items),
          i != k do
        val
      end
      |> Enum.sum

    div cost, 2
  end
end

[_n, k] = Input.read_integers()
items = Input.read_integers()
[charged] = Input.read_integers()

output =
  case Solution.actual_cost(items, k) do
    ^charged -> "Bon Appetit"
    actual -> charged - actual
  end

IO.puts output
