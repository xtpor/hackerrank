
defmodule Solution do

  def parse_triplet(string) do
    string
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def compare(triplet_a, triplet_b) do
    compare(triplet_a, triplet_b, 0, 0)
  end

  def compare([], [], a_score, b_score) do
    [a_score, b_score]
  end

  def compare([a | a_rest], [b | b_rest], as, bs) do
    cond do
      a > b -> compare(a_rest, b_rest, as + 1, bs)
      a < b -> compare(a_rest, b_rest, as, bs + 1)
      a == b -> compare(a_rest, b_rest, as, bs)
    end
  end

  def run() do
    a = IO.gets("") |> parse_triplet()
    b = IO.gets("") |> parse_triplet()

    compare(a, b)
    |> Enum.join(" ")
    |> IO.puts
  end

end

Solution.run()
