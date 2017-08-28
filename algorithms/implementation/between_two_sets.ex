
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do
  def factor?(a, b) do
    rem(b, a) == 0
  end

  def all_are_factor?(numbers, x) do
    Enum.all?(numbers, fn num -> factor?(num, x) end)
  end

  def factor_in_all?(x, numbers) do
    Enum.all?(numbers, fn num -> factor?(x, num) end)
  end

  def between(set_a, set_b) do
    1..100
    |> Enum.filter(fn x ->
      all_are_factor?(set_a, x) and factor_in_all?(x, set_b)
    end)
  end
end

[_n, _m] = Input.read_integers()
set_a = Input.read_integers()
set_b = Input.read_integers()

Solution.between(set_a, set_b)
|> Enum.count
|> IO.puts
