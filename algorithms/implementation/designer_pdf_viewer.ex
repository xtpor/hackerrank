
import Enum

defmodule Solution do

  def run do
    heights = read_integers()
    |> List.to_tuple

    word = IO.gets("")
    |> String.trim
    |> to_charlist

    width = length(word)
    height =
      word
      |> Enum.map(&elem(heights, &1 - ?a))
      |> Enum.max

    IO.puts width * height
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
