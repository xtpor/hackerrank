
defmodule Solution do

  def leap_year?(:julian, yr) when rem(yr, 4) == 0, do: true

  def leap_year?(:gregorian, yr) when rem(yr, 400) == 0 do
    true
  end

  def leap_year?(:gregorian, yr)
      when rem(yr, 4) == 0 and rem(yr, 100) != 0 do
    true
  end

  def leap_year?(_, _), do: false

  def day_256th(false), do: {13, 9}
  def day_256th(true), do: {12, 9}
  def day_256th(:special), do: {26, 9}

  def solve(yr) when yr > 1918, do: day_256th(leap_year?(:gregorian, yr))
  def solve(yr) when yr < 1918, do: day_256th(leap_year?(:julian, yr))
  def solve(_), do: day_256th(:special)

  def pad(num) do
    String.pad_leading(to_string(num), 2, "0")
  end

  def format(year, month, day) do
    "#{pad day}.#{pad month}.#{year}"
  end

end

year =
  IO.gets("")
  |> String.trim
  |> String.to_integer

{day, month} = Solution.solve(year)

IO.puts Solution.format(year, month, day)
