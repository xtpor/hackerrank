
defmodule Solution do

  def solve(s1, s2, k) do
    case k > length(s1) + length(s2) do
      true -> true
      false -> reduce(s1, s2, k)
    end
  end

  def reduce(s1, s2, k) do
    len = length(s1) + length(s2)
    cond do
      len == k -> true
      len < k -> false
      len > k ->
        [h1 | t1] = s1
        [h2 | t2] = s2
        case h1 == h2 do
          true -> reduce(t1, t2, k)
          false -> false
        end
    end
  end

  def run do
    s1 = IO.gets("") |> String.trim |> to_charlist
    s2 = IO.gets("") |> String.trim |> to_charlist
    k = IO.gets("") |> String.trim |> String.to_integer

    case solve(s1, s2, k) do
      true -> "Yes"
      false -> "No"
    end
    |> IO.puts
  end

end

Solution.run
