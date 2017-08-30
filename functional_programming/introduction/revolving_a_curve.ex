
defmodule Solution do

  def read_integers do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def func(coff, power) do
    fn x ->
      Enum.zip(coff, power)
      |> Enum.map(fn {a, b} -> a * :math.pow(x, b) end)
      |> Enum.sum
    end
  end

  def integral(lower, upper, _) when lower > upper, do: 0
  def integral(lower, upper, f) do
    dx = 0.0005
    f.(lower) * dx + integral(lower + dx, upper, f)
  end

  def volume(lower, upper, _) when lower > upper, do: 0
  def volume(lower, upper, f) do
    dx = 0.0005
    r = f.(lower)
    r * r * :math.pi * dx + volume(lower + dx, upper, f)
  end

  def run do
    coff = read_integers()
    power = read_integers()
    [lower, upper] = read_integers()

    f = func(coff, power)
    integral(lower, upper, f)
    |> IO.puts

    volume(lower, upper, f)
    |> IO.puts
  end

end

Solution.run
