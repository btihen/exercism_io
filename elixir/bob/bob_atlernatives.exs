defmodule Bob do
  def hey(input) do
    
    yelling? = String.upcase(input) == input and String.downcase(input) != input
    asking?  = String.last(input) == "?"

    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      yelling? and asking?     -> "Calm down, I know what I'm doing!"
      yelling?                 -> "Whoa, chill out!"
      asking?                  -> "Sure."
      true                     -> "Whatever."
    end

  end
end
