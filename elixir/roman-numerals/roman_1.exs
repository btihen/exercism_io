defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  # using a since list -- order is important!
  @arabic_units [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  # use a map to map between arabic and roman numerals
  @roman_units %{ 1000 => "M", 900 => "CM", 500 => "D", 400 => "CD",
                  100 => "C", 90 => "XC", 50 => "L", 40 => "XL",
                  10 => "X", 9 => "IX", 5 => "V", 4 => "IV",
                  1 => "I"}

  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    convert(@arabic_units, number, "")
  end

  defp convert([arabic | tail], number, answer) do
    new_num = number - arabic
    cond do
      # we're done - when 0
      0 == new_num -> "#{answer}#{@roman_units[arabic]}"

      # less than zero too big - go to the next unit (tail)
      0 >  new_num -> convert(tail, number, answer)

      # redo - this same loop since we are greater than zero
      true -> convert([arabic | tail], new_num, "#{answer}#{@roman_units[arabic]}")
    end
  end
end
