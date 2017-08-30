
defmodule Solution do

  def list_to_string(list) do
    list
    |> Enum.join("\n")
  end

  def string_to_list(string) do
    string
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn s ->
      {f, _} = Float.parse(s)
      f
    end)
  end

  def run do
    IO.read(:all)
    |> string_to_list
    |> main
    |> list_to_string
    |> IO.puts
  end

  def main([_ | numbers]), do: Enum.map(numbers, fn x -> compute(x, 9) end)

  def compute(_, 0), do: 1
  def compute(x, n), do: (:math.pow(x, n) / fac(n)) + compute(x, n - 1)

  def fac(0), do: 1
  def fac(n), do: fac(n - 1) * n

end

Solution.run
