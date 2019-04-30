defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  @base_list String.codepoints("abcdefghijklmnopqrstuvwxyz")

  defmacro uppercase?(char) do
    char == String.upcase(char) && letter?(char)
  end

  defmacro lowercase?(char) do
    char == String.downcase(char) && letter?(char)
  end

  defmacro letter?(char) do
    # Enum.any?(@base_list, fn x -> String.downcase(char) == x end)
    Enum.member?(@base_list, char)
  end

  defmacro non_letter?(char) do
    lowercase = String.downcase(char)
    !( Enum.any?(@base_list, fn x -> lowercase == x end) )
  end

  def rotate(text_in, shift) do
    text_list   = String.codepoints(text_in)
    cipher_list = build_cipher_list(shift)
    encrypt(text_list, cipher_list, "")
  end

  defp build_cipher_list(shift) do
    {first , second} = Enum.split(@base_list, shift)
    List.flatten([second|first])
  end

  defp encrypt( [ head_char | [] ], cipher_list, answer) do
    "#{answer}#{rotate(head_char, cipher_list)}"
  end

  defp encrypt( [ head_char | tail_list ], cipher_list, answer) do
    encrypted_char = encrypt([head_char], cipher_list, answer)
    encrypt( tail_list, cipher_list, encrypted_char )
  end

  # non-letter
  defp rotate(char, cipher_list) when non_letter?(char), do: char

  # capital letter rotation (send the lowercase)
  defp rotate(char, cipher_list) when lowercase?(char) do
    rotate_char(String.downcase(char), cipher_list) |> String.upcase
  end

  # lowercase rotation
  defp rotate(char, cipher_list) when uppercase?(char) do
    base_index = Enum.find_index(@base_list, fn x -> char == x end)
    {encrypted_char, _} = List.pop_at(cipher_list, base_index)
    encrypted_char
  end
end
