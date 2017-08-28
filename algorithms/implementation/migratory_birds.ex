
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do

  def count(numbers), do: count(numbers, %{})

  def count([], counter), do: counter
  def count([h | t], counter) do
     count(t, Map.update(counter, h, 0, fn x -> x + 1 end))
  end

end

[_n] = Input.read_integers()

counter =
  Input.read_integers()
  |> Solution.count

max_count = counter
  |> Enum.map(fn {_, c} -> c end)
  |> Enum.max

counter
|> Enum.filter(fn {_, c} -> c == max_count end)
|> Enum.map(fn {id, _} -> id end)
|> Enum.at(0)
|> IO.puts
