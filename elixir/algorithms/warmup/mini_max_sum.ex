
defmodule Solution do

  def run() do
    nums =
      IO.gets("")
      |> String.trim
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    sum = Enum.sum(nums)
    max = Enum.max(nums)
    min = Enum.min(nums)

    IO.puts "#{sum - max} #{sum - min}"
  end

end

Solution.run()
