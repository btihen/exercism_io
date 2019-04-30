defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, fn x -> nucleotide == x end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    count = fn s, n -> Enum.count(s, fn x -> n == x end) end
    # https://stackoverflow.com/questions/29924170/elixir-looping-through-and-adding-to-map
    Enum.reduce @nucleotides, %{}, fn key, acc ->
      Map.put(acc, key, count.(strand, key))
    end
  end
end
