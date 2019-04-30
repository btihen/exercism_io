defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    words = string
            |> Macro.underscore               # convert camel case to snake case
            |> String.replace(~r/[_-]/, " ")  # replace - & _ with spaces
            |> String.split                   # split on spaves
    # IO.puts "\nWORDS"
    # Enum.map(words, fn e -> IO.puts e end)

    acro  = words
            |> Enum.map_join( &String.first(&1) ) # get first letter of each word & join
            |> String.upcase                      # upcase string
    # IO.puts "-----\nANS: #{acro}"
    acro
  end
end
