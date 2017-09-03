
defmodule Solution do

  def uniq([]), do: []
  def uniq([h | t]), do: [h | uniq(t, h)]

  def uniq([], _), do: []
  def uniq([h | t], h), do: uniq(t, h)
  def uniq([h | t], _), do: [h | uniq(t, h)]

  def rank(nums, target) do
    rank(nums, 0, tuple_size(nums) - 1, target)
  end

  def rank(nums, min, _, target) when target > elem(nums, min) do
    min
  end

  def rank(nums, _, max, target) when target < elem(nums, max) do
    max + 1
  end

  def rank(nums, min, max, target) when min <= max do
    mid = div(min + max, 2)
    item = elem(nums, mid)
    cond do
      item > target -> rank(nums, mid + 1, max, target)
      item == target -> mid
      item < target -> rank(nums, min, mid - 1, target)
    end
  end

  def run do
    _ = read_integers()
    scores = read_integers() |> uniq |> List.to_tuple
    _ = read_integers()
    alice_scores = read_integers()

    Enum.map alice_scores, fn s ->
      IO.puts rank(scores, s) + 1
    end
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
