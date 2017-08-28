
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do

  def kangaroo(x, _, x, _), do: "YES"
  def kangaroo(_, v, _, v), do: "NO"
  def kangaroo(x1, v1, x2, v2) when x1 > x2 and v1 > v2, do: "NO"
  def kangaroo(x1, v1, x2, v2) when x2 > x1 and v2 > v1, do: "NO"
  def kangaroo(x1, v1, x2, v2), do: kangaroo(x1 + v1, v1, x2 + v2, v2)

end

[x1, v1, x2, v2] = Input.read_integers()
IO.puts Solution.kangaroo(x1, v1, x2, v2)
