defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  @base String.codepoints("abcdefghijklmnopqrstuvwxyz")
  def rotate(text_in, shift) do
    text_list   = build_text_list(text_in)
    cipher_list = build_cipher_list(shift)
    encrypt(text_list, cipher_list, "")
  end

  defp build_text_list(text_in), do: String.codepoints(text_in)

  defp build_cipher_list(shift) do
    {first , second} = Enum.split(@base, shift)
    List.flatten([second|first])
  end

  defp encrypt( [ head_char | [] ], cipher_list, answer) do
    "#{answer}#{encrypt(head_char, cipher_list)}"
  end

  defp encrypt( [ head_char | tail_list ], cipher_list, answer) do
    encrypted_char = encrypt([head_char], cipher_list, answer)
    encrypt( tail_list, cipher_list, encrypted_char )
  end

  defp encrypt(char, cipher_list) do
    lowercase = String.downcase(char)
    letter?   = Enum.any?(@base, fn x -> lowercase == x end)
    capital?  = ( char == String.upcase(char) )
    cond do
      # matches if upercase (A-Z)
      letter? && capital?  -> encrypt_char(lowercase, cipher_list)
                              |> String.upcase
      # matches a lowercase letter (a-z)
      letter? && !capital? -> encrypt_char(char, cipher_list)

      # matches any other character
      true -> char
    end
  end

  defp encrypt_char(char, cipher_list) do
    base_index = Enum.find_index(@base, fn x -> char == x end)
    {encrypted_char, _} = List.pop_at(cipher_list, base_index)
    encrypted_char
  end
end
