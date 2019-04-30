defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare([], [nil]), do: :sublist
  def compare([nil], []), do: :superlist
  def compare(a, b) when Kernel.length(a) == Kernel.length(b) do
    equal? = ((a -- b) == (b -- a))
    cond do
      equal?     -> :equal
      not equal? -> :unequal
    end
  end
  def compare(a, b) do
    a_in_b? = ( [] == (a -- b) )
    b_in_a? = ( [] == (b -- a) )
    a_length = Kernel.length(a)
    b_length = Kernel.length(b)
    a_longer? = (a_length > b_length)
    b_longer? = (a_length < b_length)
    a_multiple_of_b? = (0 == rem(a_length, b_length))
    b_multiple_of_a? = (0 == rem(b_length, a_length))

    cond do
       a_in_b? && !b_in_a? && b_longer? && b_multiple_of_a? -> if subset?(a, b), do: :sublist, else: :unequal
       a_in_b? && !b_in_a? && b_longer? -> :sublist
      !a_in_b? &&  b_in_a? && a_longer? && a_multiple_of_b? -> if subset?(b, a), do: :superlist, else: :unequal
      !a_in_b? &&  b_in_a? && a_longer? -> :superlist
      true                              -> :unequal
    end
  end

  def subset?(a, b) do
    # https://stackoverflow.com/questions/43007449/elixir-reduce-list-to-map-counting-occurrences-pattern-match-a-map-key-on-anot
    a_counts = a |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    # [1, 2, 1, 2, 3] -> %{1 => 2, 2 => 2, 3 => 1}
    b_counts = b |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    # [1, 2, 3, 1, 2, 1, 2, 3, 2, 1] -> %{1 => 4, 2 => 4, 3 => 2}

    Enum.all?(a_counts, fn ({key, value}) -> 0 == rem(b_counts[key],value) end )
  end


end


# defmodule Sublist do
#   @doc """
#   Returns whether the first list is a sublist or a superlist of the second list
#   and if not whether it is equal or unequal to the second list.
#   """
#
#   def compare([], [nil]), do: :sublist
#   def compare([nil], []), do: :superlist
#   def compare(a, b) when Kernel.length(a) == Kernel.length(b) do
#     equal? = ((a -- b) == (b -- a))
#     cond do
#       equal?     -> :equal
#       not equal? -> :unequal
#     end
#   end
#   # def compare(a, b) when Kernel.length(a) < Kernel.length(b) do
#   #   # https://stackoverflow.com/questions/43007449/elixir-reduce-list-to-map-counting-occurrences-pattern-match-a-map-key-on-anot
#   #   # [1, 2, 3, 1, 2, 1, 2, 3, 2, 1] -> %{1 => 4, 2 => 4, 3 => 2}
#   #   b_counts = b |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
#   #   # [1, 2, 1, 2, 3] -> %{1 => 2, 2 => 2, 3 => 1}
#   #   a_counts = a |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
#   #
#   #   sublist? = Enum.all?(a_counts, fn ({key, value}) -> 0 == rem(b_counts[key],value) end )
#   #
#   #   cond do
#   #     sublist?     -> :sublist
#   #     not sublist? -> :unequal
#   #   end
#   # end
#   def compare(a, b) do
#     a_in_b? = ( [] == (a -- b) )
#     b_in_a? = ( [] == (b -- a) )
#
#     # a_length  = Enum.count(a)
#     # a_length  = Kernel.length(a)
#
#     # b_length  = Enum.count(b)
#     # b_length  = Kernel.length(b)
#     # b_counts  = b |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
#
#     # ab_zip    = List.zip([a,b])
#     # zip_count = Enum.count(ab_zip)
#
#     # a_sublist_b?   = (  a_in_b? && !b_in_a? )
#     # a_superlist_b? = ( !a_in_b? &&  b_in_a? )
#     cond do
#        a_in_b? && !b_in_a? -> :sublist
#       !a_in_b? &&  b_in_a? -> :superlist
#       true                 -> :unequal
#     end
#   end
#
# end
