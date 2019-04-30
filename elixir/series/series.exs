defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices([], size),                   do: []
  def slices(string, size) when size < 1, do: []
  def slices(string, size) do
    string
    |> String.graphemes
    |> Enum.chunk_every(size, 1, :discard)
    |> Enum.map(&Enum.join/1)
    # |> Enum.map( &Enum.join(&1) )

    # chunks  = string
    #           |> String.graphemes
    #           |> Enum.chunk_every(size, 1, :discard)
    # chunks |> Enum.map( &Enum.join(&1) )
    # or
    # # Enum.map(chunks, fn chunk -> Enum.join(chunk) end)
  end
end
