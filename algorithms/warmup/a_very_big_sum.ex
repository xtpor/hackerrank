
defmodule Solution do

  def run() do
    IO.gets("")
    IO.gets("")
    |> String.trim
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
    |> IO.puts
  end

end

Solution.run()
