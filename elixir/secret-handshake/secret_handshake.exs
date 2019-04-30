defmodule SecretHandshake do
  use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    # test_masks = [1, 2, 4, 8]
    tests   = test_order(code)
    decoded = ( for x <- tests, do: lookup(code, x) )
    decoded |> Enum.uniq |> List.delete("")
  end

  defp test_order(code) do
    calc = code &&& 0b10000 # 16
    cond do
      calc == 16 -> [8, 4, 2, 1]    # if code matches 16 bit then reverse
      true       -> [1, 2, 4, 8]
      # calc != 16 -> [1, 2, 4, 8]  # if code matches 16 bit then reverse
      # true       -> [8, 4, 2, 1]
    end
  end

  defp lookup(code, mask_key) do
    code_keys  = %{ 8 => "jump",
                    4 => "close your eyes",
                    2 => "double blink",
                    1 => "wink" }
    calc = code &&& mask_key
    cond do
      calc == mask_key -> code_keys[mask_key]
      true             -> ""
    end
  end

end
