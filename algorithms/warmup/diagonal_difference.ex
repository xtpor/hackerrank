
defmodule Solution do

  def indexes_sum(indexes, matrix) do
    indexes
    |> Enum.map(fn {x, y} -> matrix |> elem(x) |> elem(y) end)
    |> Enum.sum()
  end

  def primary_sum({size, matrix}) do
    0..(size - 1)
    |> Enum.map(fn i -> {i, i} end)
    |> indexes_sum(matrix)
  end

  def secondary_sum({size, matrix}) do
    0..(size - 1)
    |> Enum.map(fn i -> {i, (size - 1) - i} end)
    |> indexes_sum(matrix)
  end

  def diagonal_sum(matrix_size) do
    primary_sum(matrix_size) - secondary_sum(matrix_size)
    |> abs
  end

  def parse_line(line) do
    line
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  def parse_matrix(lines) do
    matrix =
      lines
      |> Enum.map(&parse_line/1)
      |> List.to_tuple

    {length(lines), matrix}
  end

  def run() do
    size = IO.gets("") |> String.trim |> String.to_integer

    0..(size - 1)
    |> Enum.map(fn _ -> IO.gets("") end)
    |> parse_matrix
    |> diagonal_sum
    |> IO.puts
  end

end

Solution.run()
