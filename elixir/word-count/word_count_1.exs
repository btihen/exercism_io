defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    # sentence = "one fish two fish"
    #
    # build a lowercase list of just words (remove puntuation - keep hythenated words)
    # all_words = ["one","fish","two","fish"]
    all_words = sentence
              |> String.replace(~r/[ _,:!&@$%^&\.]/, " ")
              |> String.downcase
              |> String.split
    # build a map of the unique words in the sentence with their frequency count
    # all_words + %{"one" => 1, "fish" => 4, "two" => 1}
    all_words
    |> Enum.uniq            # remove duplicate entries
    |> Enum.chunk_every(1)  # make arrays with x elements in sub arrays
    |> Map.new(fn [k] -> {k, word_frequency(all_words, k)} end) # builds an array of tuples
  end

  defp word_frequency(all_words, word) do
    Enum.count(all_words, &(&1 == word) )
  end

end
