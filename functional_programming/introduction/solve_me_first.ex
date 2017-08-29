
defmodule Solution do
  def read_integer do
    IO.gets("") |> String.trim |> String.to_integer
  end
end

a = Solution.read_integer
b = Solution.read_integer
IO.puts a + b
