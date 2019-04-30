defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    words = phrase |> String.split
    Enum.map_join(words, " ", &parse/1)
  end

  defp parse(word) do
    length       = word    |> String.length
    letters      = word    |> String.codepoints
    first_letter = letters |> List.first

    split_index  = find_split(letters, length)

    head    = letters |> Enum.slice(0..split_index)        |> Enum.join
    tail    = letters |> Enum.slice(split_index+1..length) |> Enum.join

    first_constant_idx = letters |> Enum.find_index(fn x -> Regex.match?(~r/[^aeiouxy]/,x) end)

    cond do
      Regex.match?(~r/[xy]/,first_letter) &&
                     first_constant_idx == 1 -> build(word)
      Regex.match?(~r/[aeiou]/,first_letter) -> build(word)
      true                                   -> build(head, tail)
    end
  end

  defp find_split(letters, length) do
    vowel_idx = letters |> Enum.slice(1..length)  # ignore first character
                        |> Enum.find_index(fn x -> Regex.match?(~r/[aeiouy]/,x) end)

    q_idx     = letters |> Enum.find_index(fn x -> "q" == x end)
    u_idx     = letters |> Enum.find_index(fn x -> "u" == x end)

    cond do
      (q_idx != nil) && (u_idx != nil) &&
                    (q_idx + 1 == u_idx) -> vowel_idx + 1
      true                               -> vowel_idx
    end

  end

  defp build(word),       do: word <> "ay"
  defp build(head, tail), do: tail <> head <> "ay"

end
