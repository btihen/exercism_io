defmodule TwelveDays do
  @days %{ 1 => %{ordinal: "first",    verse: "a Partridge in a Pear Tree"},
           2 => %{ordinal: "second",   verse: "two Turtle Doves"},
           3 => %{ordinal: "third",    verse: "three French Hens"},
           4 => %{ordinal: "fourth",   verse: "four Calling Birds"},
           5 => %{ordinal: "fifth",    verse: "five Gold Rings"},
           6 => %{ordinal: "sixth",    verse: "six Geese-a-Laying"},
           7 => %{ordinal: "seventh",  verse: "seven Swans-a-Swimming"},
           8 => %{ordinal: "eighth",   verse: "eight Maids-a-Milking"},
           9 => %{ordinal: "ninth",    verse: "nine Ladies Dancing"},
          10 => %{ordinal: "tenth",    verse: "ten Lords-a-Leaping"},
          11 => %{ordinal: "eleventh", verse: "eleven Pipers Piping"},
          12 => %{ordinal: "twelfth",  verse: "twelve Drummers Drumming"}
         }
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(1) do
    "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
  end
  def verse(number) do
    range = Enum.reverse(1..number)
    gifts = Enum.map_join(range, ", ", &refrain/1)
    # gifts = range |> Enum.map(&refrain/1) |> Enum.join(", ")
    # gifts = Enum.map_join(range, ", ", fn num -> refrain(num) end)
    "On the #{@days[number][:ordinal]} day of Christmas my true love gave to me: #{gifts}."
  end
  defp refrain(1),   do: "and a Partridge in a Pear Tree"
  defp refrain(num), do: @days[num][:verse]


  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    range = (starting_verse..ending_verse)
    Enum.map_join(range, "\n", fn num -> verse(num) end)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
