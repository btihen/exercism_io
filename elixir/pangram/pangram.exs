defmodule Pangram do

  @alphabet ( ?a..?z |> Enum.map( &Kernel.to_string([&1]) ) )
  # @alphabet [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
  #             "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  @spec pangram?(String.t()) :: boolean
  def pangram?(""), do: false
  def pangram?(sentence) do
    letters  = sentence |> String.replace(~r/[\s\d\W]/, "")
                        |> String.downcase |> String.graphemes
                        |> Enum.sort |> Enum.uniq
    # is every letter of the alphbet found in list of letters of the sentence
    Enum.all?(@alphabet, &(&1 in letters))
  end

end
