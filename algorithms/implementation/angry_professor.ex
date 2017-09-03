
defmodule Solution do

  def run do
    [cases] = read_integers()
    for _ <- 0..(cases - 1) do
      [_, k] = read_integers()
      students_time = read_integers()

      num_ontime =
        students_time
        |> Enum.filter(&(&1 <= 0))
        |> Enum.count

      case num_ontime < k do
        true -> "YES"
        false -> "NO"
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
