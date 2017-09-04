
defmodule Solution do

  def calculate({d, m, y}, {d1, m1, y1}) do
    cond do
      d > d1 and m == m1 and y == y1 ->
        (d - d1) * 15
      m > m1 and y == y1 ->
        (m - m1) * 500
      y > y1 ->
        10000
      true ->
        0
    end
  end

  def run do
    return_date = read_integers() |> List.to_tuple
    due_date = read_integers() |> List.to_tuple

    calculate(return_date, due_date)
    |> IO.puts
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
