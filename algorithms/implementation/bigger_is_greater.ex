
defmodule Solution do

  def dsuffix(str), do: dsuffix(str, tuple_size(str) - 1)

  def dsuffix(_, 0), do: 0

  def dsuffix(str, i) when elem(str, i - 1) >= elem(str, i) do
    dsuffix(str, i - 1)
  end

  def dsuffix(_, i) do
    i
  end

  def rsucc(str, pivot), do: rsucc(str, tuple_size(str) - 1, pivot)

  def rsucc(_, p, p), do: p
  def rsucc(str, i, p) when elem(str, i) > elem(str, p), do: i
  def rsucc(str, i, p), do: rsucc(str, i - 1, p)

  def swap(str, i, j) do
    str
    |> put_elem(i, elem(str, j))
    |> put_elem(j, elem(str, i))
  end

  def reverse_suf(list, -1), do: Enum.reverse(list)
  def reverse_suf([h | t], pivot), do: [h | reverse_suf(t, pivot - 1)]

  def next_prem(list) do
    str = List.to_tuple(list)
    case dsuffix(str) do
      0 -> list
      dsuf ->
        pivot = dsuf - 1
        swap(str, pivot, rsucc(str, pivot))
        |> Tuple.to_list
        |> reverse_suf(pivot)
    end
  end

  def run do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n do
      str = IO.gets("") |> String.trim |> to_charlist
      next_str = next_prem(str)

      if str == next_str do
        "no answer"
      else
        next_str
      end
      |> IO.puts
    end
  end

end

Solution.run
