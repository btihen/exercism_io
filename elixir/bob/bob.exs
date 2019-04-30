defmodule Bob do
  def hey(input) do

    empty?     = String.trim(input) == ""
    question?  = String.ends_with?(input, "?")

    only_chars = String.replace(input, ~r/[\d\W]/, "")
    nonsense?  = "" == only_chars
    urgent?    = only_chars == String.upcase(only_chars)

    calm_question?    =  question? && (!urgent? || nonsense?)
    urgent_question?  =  question? &&   urgent? && !nonsense?
    urgent_statement? = !question? &&   urgent? && !nonsense?

    cond do
      urgent_statement? -> "Whoa, chill out!"
      urgent_question?  -> "Calm down, I know what I'm doing!"
      calm_question?    -> "Sure."
      empty?            -> "Fine. Be that way!"
      true              -> "Whatever."
    end

  end
end
