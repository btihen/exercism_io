defmodule ProteinTranslation do
  @condon_names %{"UGU" => "Cysteine",      "UGC" => "Cysteine",
                  "UUA" => "Leucine",       "UUG" => "Leucine",
                  "AUG" => "Methionine",    "UGG" => "Tryptophan",
                  "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
                  "UAU" => "Tyrosine",      "UAC" => "Tyrosine",
                  "UCU" => "Serine",        "UCC" => "Serine",
                  "UCA" => "Serine",        "UCG" => "Serine",
                  "UAA" => "STOP",          "UAG" => "STOP",
                  "UGA" => "STOP" }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    cond do
      0 != rem(String.length(rna), 3) -> { :error, "invalid RNA" }
      String.match?(rna, ~r/[^ACGU]/) -> { :error, "invalid RNA" }
      true                            -> get_names(rna)
    end
  end

  # defp get_names(rna) when ~r/[^ACGU]/, do: { :error, "invalid RNA" }
  defp get_names(rna) do
    rna_length = String.length(rna)
    rna_head   = String.slice(rna, 0..2)
    rna_tail   = String.slice(rna, 3..rna_length)
    { :ok, condons_list(rna_head, rna_tail, []) }
  end

  defp condons_list("UAA", _, condon_names), do: condon_names
  defp condons_list("UAG", _, condon_names), do: condon_names
  defp condons_list("UGA", _, condon_names), do: condon_names
  defp condons_list(rna_head, "", condon_names) do
    Enum.concat(condon_names, [@condon_names[rna_head]])
  end
  defp condons_list(rna_head, rna_tail, condon_names) do
    rna_length = String.length(rna_tail)
    new_start  = String.slice(rna_tail, 0..2)
    new_tail   = String.slice(rna_tail, 3..rna_length)
    names_joined = condons_list(rna_head, "", condon_names)
    condons_list(new_start, new_tail, names_joined)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  # def of_codon(codon) when ~r/[^ACGU]/, do: { :error, "invalid condon" }
  def of_codon(codon) do
    cond do
      0 != rem(String.length(codon), 3) -> { :error, "invalid codon" }
      String.match?(codon, ~r/[^ACGU]/) -> { :error, "invalid codon" }
      true                              -> { :ok, @condon_names[codon] }
    end
  end
end
