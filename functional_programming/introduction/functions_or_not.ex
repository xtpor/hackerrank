
defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def function?(pairs), do: function?(pairs, %{})
  def function?([], _), do: "YES"
  def function?([{x, y} | t], mapping) do
    case Map.has_key?(mapping, x) do
      true -> "NO"
      false -> function?(t, Map.put(mapping, x, y))
    end
  end

  def run do
    [num_case] = read_integers()

    for _ <- 0..(num_case - 1) do
      [num_pair] = read_integers()

      for _ <- 0..(num_pair - 1) do
        read_integers()
        |> List.to_tuple
      end
      |> function?
      |> IO.puts
    end
  end

end

Solution.run
