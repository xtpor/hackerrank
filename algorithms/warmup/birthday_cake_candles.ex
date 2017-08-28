
IO.gets("")

num = IO.gets("")
  |> String.trim
  |> String.split(" ")
  |> Enum.map(&String.to_integer/1)

max = Enum.max(num)

num
|> Enum.count(fn x -> x == max end)
|> IO.puts
