
defmodule Converter do

  def parse(string) do
    import String, only: [to_integer: 1]

    pattern = ~r/(\d\d):(\d\d):(\d\d)(AM|PM)/
    [_, hh, mm, ss, fmt] = Regex.run(pattern, string)
    {to_integer(hh), to_integer(mm), to_integer(ss), fmt}
  end

  def convert({12, mm, ss, "AM"}), do: {0, mm, ss}
  def convert({hh, mm, ss, "AM"}), do: {hh, mm, ss}
  def convert({12, mm, ss, "PM"}), do: {12, mm, ss}
  def convert({hh, mm, ss, "PM"}), do: {hh + 12, mm, ss}

  def format({hh, mm, ss}) do
     "#{pad hh}:#{pad mm}:#{pad ss}"
  end

  def pad(num) do
    String.pad_leading(to_string(num), 2, "0")
  end

end

IO.gets("")
|> String.trim
|> Converter.parse
|> Converter.convert
|> Converter.format
|> IO.puts
