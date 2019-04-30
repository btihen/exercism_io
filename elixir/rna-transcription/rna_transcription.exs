defmodule RNATranscription do
  @doc """
  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &transcribe/1)
    # equivalent to:
    # Enum.map(dna, fn x -> transcribe(x) end)
  end

  def transcribe(char) do
    case char do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end
  end

end
