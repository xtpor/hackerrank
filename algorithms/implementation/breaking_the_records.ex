
defmodule Input do
  def read_integers() do
    IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Solution do

  def track([f | r]), do: track(r, f, 0, f, 0)

  def track([], _, nb, _, nw), do: [nb, nw]
  def track([s | r], b, nb, w, nw) when s > b, do: track(r, s, nb + 1, w, nw)
  def track([s | r], b, nb, w, nw) when s < w, do: track(r, b, nb, s, nw + 1)
  def track([_ | rest], b, nb, w, nw), do: track(rest, b, nb, w, nw)

end

[_num_games] = Input.read_integers()
Input.read_integers()
|> Solution.track
|> Enum.join(" ")
|> IO.puts
