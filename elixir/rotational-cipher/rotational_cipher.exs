defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  # trying out pattern mating in functions
  # https://hexdocs.pm/elixir/guards.html
  # https://keathley.io/2016/04/09/elixir-guard-clauses.html
  # https://stackoverflow.com/questions/31185006/how-to-use-the-in-operator-in-guard-clauses
  @base String.codepoints("abcdefghijklmnopqrstuvwxyz")
  @caps String.codepoints("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text_in, shift) do
    text_list   = String.codepoints(text_in)
    cipher_list = build_cipher_list(shift)
    encrypt_loop(text_list, cipher_list, "")
  end

  # build the rotated character list
  defp build_cipher_list(shift) do
    {first , second} = Enum.split(@base, shift)
    List.flatten([second|first])
  end

  # loop through character - when only head add to answer
  defp encrypt_loop( [ head_char | [] ], cipher_list, answer) do
    "#{answer}#{encrypt_char(head_char, cipher_list)}"
  end
  defp encrypt_loop( [ head_char | tail_list ], cipher_list, answer) do
    encrypted_char = encrypt_loop([head_char], cipher_list, answer)
    encrypt_loop( tail_list, cipher_list, encrypted_char )
  end

  # match for the rotated character (non-letters are not encrypted)
  defp encrypt_char(char, cipher_list) when (char in @base) do
    base_index = Enum.find_index(@base, fn x -> char == x end)
    {encrypted_char, _} = List.pop_at(cipher_list, base_index)
    encrypted_char
  end
  defp encrypt_char(char, cipher_list) when (char in @caps) do
    encrypt_char(String.downcase(char), cipher_list) |> String.upcase
  end
  defp encrypt_char(char, _), do: char

end
