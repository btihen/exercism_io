defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(string) do
    letters = string  |> String.codepoints
    count_run(letters, "")
  end

  defp add_encoding(1, letter, accum),     do: accum <> "#{letter}"
  defp add_encoding(nil, letter, accum),   do: accum <> "#{letter}"
  defp add_encoding(count, letter, accum), do: accum <> "#{count}#{letter}"

  defp count_run([], accum),     do: accum
  defp count_run(letters, accum) do
    length   = letters |> Enum.count
    first    = letters |> Enum.at(0)

    diff_idx = letters |> Enum.find_index(fn l -> l != first end)
    count    = if diff_idx == nil, do: length, else: diff_idx

    new_list = if diff_idx == nil, do: [], else: Enum.slice(letters, count..length)
    new_acc  = add_encoding(count, first, accum)

    count_run(new_list, new_acc)
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""
  def decode(string) do
    expand_letters(start_w_number?(string), string, "")
  end

  defp start_w_number?(""),   do: false
  defp start_w_number?(string) do
    string |> String.first |> String.match?(~r/\d/)
  end

  defp expand_letters(_, "", output), do: output
  defp expand_letters(false, string, output) do
    {next_char, tail_str} = String.split_at(string, 1)
    
    expand_letters(start_w_number?(tail_str), tail_str, output <> next_char)
  end
  defp expand_letters(true, string, output) do
    {number, temp_str}   = Integer.parse(string)
    {next_char, tail_str} = String.split_at(temp_str, 1)
    new_output = output <> String.duplicate(next_char, number)

    expand_letters(start_w_number?(tail_str), tail_str, new_output)
  end
end
