defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @sound_hash %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
  @sound_units Map.keys(@sound_hash)

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    only_sounds   = @sound_units
                    |> Enum.map( fn num -> find_sound(number,num) end )
                    |> Enum.reject(&is_nil/1)
                    |> Enum.uniq
                    |> Enum.reject(&is_number/1)
                    |> Enum.join("")
    cond do
      ("" == only_sounds) -> "#{number}"
      true                -> only_sounds
    end
  end

  defp find_sound(number, num) do
    cond do
      0 == rem(number, num) -> @sound_hash[num]
      true                  -> number
    end
  end
  
end
