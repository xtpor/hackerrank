
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do

  def divisible_by(a, b), do: rem(a, b) == 0

  def solve(nums, k) do
    n = tuple_size(nums)

    for i <- 0..(n-1),
        j <- 0..(n-1),
        i < j,
        divisible_by(elem(nums, i) + elem(nums, j), k) do
      {i, j}
    end
  end
end

[_n, k] = Input.read_integers()
numbers =
  Input.read_integers()
  |> List.to_tuple

Solution.solve(numbers, k)
|> Enum.count
|> IO.puts
