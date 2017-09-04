
import Enum

defmodule Solution do

  def cut(sticks) do
    smallest = Enum.min(sticks)

    sticks
    |> map(&(&1 - smallest))
    |> filter(&(&1 > 0))
  end

  def process([]) do
    []
  end

  def process(sticks) do
    [length(sticks) | sticks |> cut |> process]
  end

  def run do
    _ = read_integers()
    read_integers()
    |> process
    |> map(&IO.puts/1)
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
