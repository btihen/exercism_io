defmodule Bob do
  def hey(input) do

    blank?    = fn x -> ("" == String.trim(x)) end
    upcase?   = fn x -> (x  == String.upcase(x)) end
    question? = fn x -> (String.ends_with?(x, "?")) end
    only_txt  = fn x -> (String.replace(x, ~r/[\d\W]/, "")) end
    no_txt?   = fn x -> ("" == String.replace(x, ~r/[\d\W]/, "")) end

    cond do
      blank?.(input)    -> "Fine. Be that way!"

      question?.(input) && no_txt?.(input)
                        -> "Sure."

      no_txt?.(input)   -> "Whatever."

      question?.(input) && upcase?.(input)  # && upcase?.(only_txt.(input))
                        -> "Calm down, I know what I'm doing!"

      upcase?.(only_txt.(input))
                        -> "Whoa, chill out!"

      question?.(input) -> "Sure."

      true              -> "Whatever."
    end
  end
end
