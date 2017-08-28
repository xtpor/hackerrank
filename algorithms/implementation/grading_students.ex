
defmodule Grading do

  def rounding(score) when score < 38, do: score

  def rounding(score) do
    next_num = next_multiple(score, 5)
    if next_num - score < 3 do
      next_num
    else
      score
    end
  end

  def next_multiple(number, round_to) do
    round(Float.ceil(number / round_to) * round_to)
  end

  def read() do
    IO.gets("")
    |> String.trim
    |> String.to_integer
  end

end

num_case = Grading.read()
for _ <- 0..num_case - 1 do
  Grading.read() |> Grading.rounding |> IO.puts
end
