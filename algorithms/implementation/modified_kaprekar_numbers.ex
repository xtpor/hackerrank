
defmodule Solution do

  def kaprekar?(num) do
    d = num |> to_string |> String.length
    square = num * num |> to_string
    r = square |> String.slice(-d..-1) |> to_integer
    l = square |> String.slice(0..(-d - 1)) |> to_integer
    num == r + l
  end

  def to_integer(str) do
    case str == "" do
      true -> 0
      false -> String.to_integer(str)
    end
  end

  def run do
    low = IO.gets("") |> String.trim |> String.to_integer
    high = IO.gets("") |> String.trim |> String.to_integer

    numbers = Enum.filter(low..high, &kaprekar?/1)
    case numbers == [] do
      true -> "INVALID RANGE"
      false -> Enum.join(numbers, " ")
    end
    |> IO.puts
  end

end

Solution.run
