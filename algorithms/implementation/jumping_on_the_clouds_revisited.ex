
defmodule Solution do

  def jump(n, k, tb) do
    jump(0, 100, n, k, tb)
  end

  def jump(_c, 0, _n, _k, _tb), do: 0

  def jump(c, e, n, k, tb) do
    c = rem(c + k, n)

    delta_e =
      case type(tb, c) do
        :ordinary -> 1
        :thundercloud -> 3
      end
    e = max(0, e - delta_e)

    case c == 0 do
      true -> e
      false -> jump(c, e, n, k, tb)
    end
  end

  def type(tb, c) do
    case elem(tb, c) do
      0 -> :ordinary
      1 -> :thundercloud
    end
  end

  def run do
    [n, k] = read_integers()
    tb = read_integers() |> List.to_tuple

    IO.puts jump(n, k, tb)
  end

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

end

Solution.run
