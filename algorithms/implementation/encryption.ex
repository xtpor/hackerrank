
defmodule Solution do

  def num_column(str) do
    str |> tuple_size |> :math.sqrt |> Float.ceil |> trunc
  end

  def encrypt(str) do
    str = str |> String.codepoints |> List.to_tuple
    col_start(str, 0, num_column(str), [])
    |> Enum.join
  end

  def col_start(_, c, col, [_ | acc]) when c >= col, do: Enum.reverse(acc)
  def col_start(str, c, col, acc), do: col_start(str, c + 1, col, col_char(str, c, col, acc))

  def col_char(str, i, _, acc) when i >= tuple_size(str), do: [" " | acc]
  def col_char(str, i, col, acc), do: col_char(str, i + col, col, [elem(str, i) | acc])

  def run do
    IO.gets("")
    |> String.trim
    |> encrypt
    |> IO.puts
  end

end

Solution.run
