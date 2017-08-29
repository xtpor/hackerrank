
defmodule Solution do

  def read_integer do
    IO.gets("") |> String.trim |> String.to_integer
  end

  def helloworld(0), do: nil
  def helloworld(n) do
    IO.puts "Hello World"
    helloworld(n - 1)
  end

end

Solution.read_integer
|> Solution.helloworld
