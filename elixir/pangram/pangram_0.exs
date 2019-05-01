defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @alphabet [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
              "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  @spec pangram?(String.t()) :: boolean
  def pangram?(""), do: false
  def pangram?(sentence) do
    letters = sentence |> String.replace(~r/[\s\d\W]/, "")
                       |> String.downcase |> String.graphemes
                       |> Enum.sort |> Enum.uniq
    do_pangram?(@alphabet -- letters)
  end
  defp do_pangram?([]), do: true
  defp do_pangram?(_),  do: false

end
