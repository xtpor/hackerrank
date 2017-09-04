
require Integer

defmodule Solution do

  # the trick is to spot the following relationship
  # (a + b) mod k = 0 if a mod k + b mod k = k

  def into_bucket(numbers, k) do
    Enum.reduce numbers, Tuple.duplicate(0, k), fn x, acc ->
      i = rem(x, k)
      put_elem acc, i, elem(acc, i) + 1
    end
  end

  def min_set_size(numbers, k) do
    bucket = into_bucket(numbers, k)

    set =
      pairs(k)
      |> Enum.map(fn {i, j} -> max elem(bucket, i), elem(bucket, j) end)
      |> Enum.sum

    zero_elem = min(1, elem(bucket, 0))

    middle_elem =
      case Integer.is_even(k) do
        true -> min(1, elem(bucket, 0))
        false -> 0
      end

    set + zero_elem + middle_elem
  end

  def pairs(1), do: []
  def pairs(k) do
    for i <- 1..div(k, 2), i != k - i, do: {i, k - i}
  end

  def run do
    [_, k] = read_integers()
    numbers = read_integers()

    IO.puts min_set_size(numbers, k)
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
