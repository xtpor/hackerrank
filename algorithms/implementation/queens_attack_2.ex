
defmodule Solution do

  def space({_, y}, n, :top), do: n - y
  def space({_, y}, _, :bottom), do: y - 1
  def space({x, _}, n, :right), do: n - x
  def space({x, _}, _, :left), do: x - 1
  def space(p, n, {hd, vd}), do: min(space(p, n, hd), space(p, n, vd))

  def diagonal?({x1, y1}, {x2, y2}) do
    abs(x1 - x2) == abs(y1 - y2)
  end

  def main_axis?({x1, y1}, {x2, y2}) do
    x1 == x2 or y1 == y2
  end

  def sign(x) do
    cond do
      x > 0 -> :positive
      x == 0 -> :zero
      x < 0 -> :negative
    end
  end

  def quadrant({x1, y1}, {x2, y2}) do
    {sign(x2 - x1), sign(y2 - y1)}
  end

  def direction(q, p) do
    cond do
      main_axis?(q, p) or diagonal?(q, p) ->
        case quadrant(q, p) do
          {:positive, :zero} -> :right
          {:negative, :zero} -> :left
          {:zero, :positive} -> :top
          {:zero, :negative} -> :bottom
          {:positive, :positive} -> {:top, :right}
          {:negative, :positive} -> {:top, :left}
          {:positive, :negative} -> {:bottom, :right}
          {:negative, :negative} -> {:bottom, :left}
        end
      true ->
        nil
    end
  end


  def between({x1, y}, {x2, y}), do: abs(x1 - x2) - 1
  def between({x, y1}, {x, y2}), do: abs(y1 - y2) - 1
  def between({x1, y1}, {x2, y2}) when abs(x1 - x2) == abs(y1 - y2) do
    abs(x1 - x2) - 1
  end

  def all_directions do
    horizontal = [:left, :right]
    vertical = [:top, :bottom]
    diagonal = for h <- horizontal, v <- vertical, do: {v, h}

    horizontal ++ vertical ++ diagonal
  end

  def solve(obstacle, queen, n) do
    remaining =
      all_directions()
      |> Enum.map(fn d -> {d, space(queen, n, d)} end)
      |> Enum.into(%{})

    Enum.reduce(obstacle, remaining, fn obst, acc ->
      case direction(queen, obst) do
        nil -> acc
        dir ->
          Map.update!(acc, dir, &min(&1, between(queen, obst)))
      end
    end)
    |> Enum.map(fn {_, dist} -> dist end)
    |> Enum.sum
  end

  def run do
    [n, k] = read_integers()
    [y, x] = read_integers()
    obstacles =
      for _ <- :lists.seq(1, k) do
        [j, i] = read_integers()
        {i, j}
      end

    IO.puts solve(obstacles, {x, y}, n)
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
