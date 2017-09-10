
defmodule Solution do

  def distri([], _, acc), do: acc
  def distri([h | t], x, acc), do: distri(t, x, [{x, h} | acc])

  def pairs(list), do: pairs(list, [])

  def pairs([], acc), do: acc
  def pairs([h | t], acc), do: pairs(t, distri(t, h, acc))

  def topics_combined({t1, t2}) do
    Enum.zip(t1, t2)
    |> Enum.map(fn {x1, x2} -> min(x1 + x2, 1) end)
    |> Enum.sum
  end

  def solve(teams) do
    teams_topics =
      pairs(teams)
      |> Enum.map(&topics_combined/1)

    max_topics =
      teams_topics
      |> Enum.max

    num_max_teams =
      teams_topics
      |> Enum.filter(&(&1 == max_topics))
      |> Enum.count

    {max_topics, num_max_teams}
  end

  def run do
    [n, _] = read_integers()
    teams =
      for _ <- 1..n do
        IO.gets("")
        |> String.trim
        |> to_charlist
        |> Enum.map(&(&1 - ?0))
      end

    {max_topics, num_teams} = solve(teams)
    IO.puts max_topics
    IO.puts num_teams
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
