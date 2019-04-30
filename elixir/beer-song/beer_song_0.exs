defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end
  def verse(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end
  def verse(2) do
    """
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
    """
  end
  def verse(number) do
    """
    #{number} bottles of beer on the wall, #{number} bottles of beer.
    Take one down and pass it around, #{number - 1} bottles of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ (99..0) ) do
    verses_list = Enum.to_list range
    (build_verses(verses_list, "") |> String.slice(1..-1)
    # (build_verses(verses_list, "") |> String.trim_trailing) <> "\n"
  end

  defp build_verses( [ current_verse | [] ], prior_verses) do
    prior_verses <> verse(current_verse) <> "\n"
  end
  defp build_verses( [ current_verse | tail_list ], prior_verses \\ "") do
    updated_verses = build_verses([current_verse], prior_verses)
    build_verses( tail_list, updated_verses )
  end

end
