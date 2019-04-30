defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    # build a lowercase list of just words (remove puntuation - keep hythenated words)
    all_words = sentence
                |> String.downcase
                |> String.split(~r{[ _,:!&#@$%^&\.]}, trim: true)
    # build a map of the unique words in the sentence with their frequency count
    all_words
    |> Enum.uniq
    |> Map.new(fn k -> {k, word_frequency(all_words, k)} end)
  end

  defp word_frequency(all_words, word) do
    Enum.count(all_words, &(&1 == word) )
  end

end
