
defmodule Solution do

  def repeat(_, 0), do: ""
  def repeat(s, t), do: s <> repeat(s, t - 1)

  def line(n, i), do: repeat(" ", n - i) <> repeat("#", i)

  def pattern(n), do: pattern(n, 1)
  def pattern(n, n), do: line(n, n)
  def pattern(n, i), do: line(n, i) <> "\n" <> pattern(n, i + 1)

  def run() do
    IO.gets("")
    |> String.trim
    |> String.to_integer
    |> pattern
    |> IO.write
  end
end

Solution.run()
