defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(fn x -> Enum.map( # make a list of all multiples (using integer division)
                                  Enum.to_list(0..Integer.floor_div(limit, x)),
                                  fn y -> y * x end  # multiple multiples by factor
                                )
                end
               )
    |> List.flatten                           # flatten nested Lists
    |> Enum.filter(fn x -> x < limit end)     # keep multiples less than the limit
    |> Enum.uniq                              # one of each multiple
    |> Enum.reduce(fn x, acc -> x + acc end)  # sum multiples

    # IO.puts "\n***************"
    # IO.inspect limit, label: "limit"
    # IO.inspect factors, label: "factors"
    #
    # max_multiples = Enum.map( factors,
    #                           fn x -> Integer.floor_div(limit, x) end
    #                         )
    # IO.inspect max_multiples, label: "max_multiples"
    #
    # all_multiples = Enum.map( factors,
    #                           fn x -> Enum.map(
    #                             Enum.to_list(0..Integer.floor_div(limit, x)),
    #                             fn y -> y * x end
    #                           )
    #                           end
    #                         )
    #                 |> List.flatten
    #                 |> Enum.filter(fn x -> x < limit end)
    #                 |> Enum.uniq
    #
    # IO.inspect all_multiples, label: "all_multiples"
    # # IO.puts "***************"
    #
    # sum_of_multiples = Enum.reduce(all_multiples, fn x, acc -> x + acc end)
    # IO.inspect sum_of_multiples, label: "sum_of_multiples"
  end
end
