defmodule Bob do
  def hey(input) do

    only_chars    = String.replace(input, ~r/[\d\W]/, "")
    empty_input?  = fn x -> ("" == String.trim(x)) end

    cond do
      demand_statement?(input, only_chars)  -> "Whoa, chill out!"
      urgent_question?(input, only_chars)   -> "Calm down, I know what I'm doing!"
      calm_question?(input, only_chars)     -> "Sure."
      empty_input?.(input)                  -> "Fine. Be that way!"
      true                                  -> "Whatever."
    end

  end

  def calm_question?(input, only_chars) do
    String.ends_with?(input, "?") && !urgent_question?(input, only_chars)
  end

  def urgent_question?(input, only_chars) do
    String.ends_with?(input, "?") && !("" == String.trim(only_chars)) &&
                                    (only_chars  == String.upcase(only_chars))
  end

  def demand_statement?(input, only_chars) do
    !(String.ends_with?(input, "?")) && !("" == String.trim(only_chars)) &&
                                    (only_chars  == String.upcase(only_chars))
  end

end
