
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do
  def count_within(offsets, lower, upper, tree) do
    offsets
    |> Enum.map(fn x -> tree + x end)
    |> Enum.filter(fn x -> lower <= x && x <= upper end)
    |> Enum.count()
  end
end

[s, t] = Input.read_integers()
[a, b] = Input.read_integers()
_ = Input.read_integers()

Input.read_integers()
|> Solution.count_within(s, t, a)
|> IO.puts

Input.read_integers()
|> Solution.count_within(s, t, b)
|> IO.puts
