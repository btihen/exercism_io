defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    # words       = String.split(String.downcase(sentence))  # make into a list of words slpit
    # total_count = Enum.count(words, &is_binary(&1))

    all_words   = sentence
                  |> String.replace(~r/[_,:!&@$%^&\.]/, " ")
                  |> String.downcase
                  |> String.split
    unique_list = Enum.uniq(all_words)
    # unique_list = sentence |> String.downcase |> String.split |> MapSet.new |> Enum.to_list
    # word        = List.first(unique_list)
    # word_count  = Enum.count(all_words, &(&1 == word) )
    # Map.put_new(map, x, Enum.count(all_words, &(&1 == x)) )
    # first = List.first(unique_list)
    # map = %{ first => word_count(all_words, first) }

    unique_list
    |> Enum.chunk_every(1)
    |> Map.new(fn [k] -> {k, word_count(all_words, k)} end)

    # Enum.each(unique_list, fn x -> Map.new(map, x, word_count(all_words, x)) end )
    # Enum.each(unique_list, fn x -> Map.put_new(map, x, word_count(all_words, x)) end )
    # map
    # Map.put_new(map, second, word_count(all_words, second) )
    # answer(map, all_words, unique_list)   # [%{"one" => 1}, %{"of" => 1}, %{"each" => 1} | nil]
    # ( for x <- unique_list, do: Map.put_new(map, x, Enum.count(all_words, &(&1 == x)) ) ) # [%{"one" => 1}, %{"of" => 1}, %{"each" => 1}]
    # ( for x <- unique_list, do: %{ x => word_count(x, all_words) } ) #  [%{"one" => 1}, %{"of" => 1}, %{"each" => 1}]
    # word_counts = (for x <- unique_list, y <- word_count(word, all_words), do: {x => y})
    # word_counts = count(all_words,all_words)
  end

  defp word_count(all_words, word) do
    Enum.count(all_words, &(&1 == word) )
  end

  # # [%{"one" => 1}, %{"of" => 1}, %{"each" => 1} | nil]
  # defp answer(map, _, []) do
  #   # map
  # end
  # defp answer(map, all_words, [first|rest]) do
  #   [ Map.put_new(map, first, Enum.count(all_words, &(&1 == first))) | answer(map, all_words, rest) ]
  # end
end
