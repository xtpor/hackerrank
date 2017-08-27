
defmodule Solution do

  def protion_in(numbers, predicate) do
    (Enum.filter(numbers, predicate) |> Enum.count) / length(numbers)
  end

  def run() do
    IO.gets("")

    numbers =
      IO.gets("")
      |> String.trim
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    protion_in(numbers, fn x -> x > 0 end) |> IO.puts
    protion_in(numbers, fn x -> x < 0 end) |> IO.puts
    protion_in(numbers, fn x -> x == 0 end) |> IO.puts
  end

end

Solution.run()
