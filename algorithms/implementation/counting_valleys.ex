
defmodule Solution do

  def count(steps), do: count(steps, 0, 0)

  def count([], _, acc), do: acc
  def count(['U' | steps], -1, acc), do: count(steps, 0, acc + 1)
  def count(['U' | steps], level, acc), do: count(steps, level + 1, acc)
  def count(['D' | steps], level, acc), do: count(steps, level - 1, acc)

  def run do
    IO.gets("")

    IO.gets("")
    |> String.trim
    |> to_charlist
    |> Enum.chunk(1)
    |> count
    |> IO.puts
  end

end

Solution.run
