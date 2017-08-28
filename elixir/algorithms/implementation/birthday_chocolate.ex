
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do

  def sum_equal(nums, m, d), do: sum_equal(nums, m, d, 0)

  def sum_equal(_, 0, d, d), do: 1
  def sum_equal(_, 0, _, _), do: 0
  def sum_equal([], m, _, _) when m > 0, do: 0
  def sum_equal([h | t], m, d, p), do: sum_equal(t, m - 1, d, p + h)

  def partition([], _, _), do: 0
  def partition(nums = [_ | rest], m, d) do
    sum_equal(nums, m, d) + partition(rest, m, d)
  end

end

[_n] = Input.read_integers()
nums = Input.read_integers()
[d, m] = Input.read_integers()

IO.puts Solution.partition(nums, m, d)
