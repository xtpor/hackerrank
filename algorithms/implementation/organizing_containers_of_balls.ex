
defmodule Solution do

  def group_by_type(matrix, n) do
    for col <- 0..n - 1 do
      for row <- 0..n - 1 do
        matrix |> elem(row) |> elem(col)
      end
      |> Enum.sum
    end
    |> counter
  end

  def group_by_container(matrix, n) do
    for row <- 0..n - 1 do
      for col <- 0..n - 1 do
        matrix |> elem(row) |> elem(col)
      end
      |> Enum.sum
    end
    |> counter
  end

  def counter(list) do
    Enum.reduce list, %{}, fn e, acc ->
      Map.update acc, e, 1, &(&1 + 1)
    end
  end

  def run do
    [num_query] = read_integers()
    for _ <- 1..num_query do
      [n] = read_integers()

      mat=
        for _ <- 1..n do
          read_integers()
          |> List.to_tuple
        end
        |> List.to_tuple

      case group_by_type(mat, n) == group_by_container(mat, n) do
        true -> "Possible"
        false -> "Impossible"
      end
      |> IO.puts
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
