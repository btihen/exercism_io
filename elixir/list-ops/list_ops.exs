defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.
  # IO.inspect head, label: "head"
  # IO.inspect tail, label: "tail"
  # IO.inspect accum, label: "accum"
  # IO.inspect fnc.(head), label: "fnc.(head)"
  # IO.inspect [accum | fnc.(head)], label: "new accum"


  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count(l),  do: counter(l)
  defp counter(list, sum \\ 0)
  # defp counter([], _),         do: 0
  defp counter([_|[]],   sum), do: sum + 1
  defp counter([_|tail], sum), do: counter(tail, sum+1)


  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(l),  do: reverser(l)
  defp reverser(list, accum \\ [])
  # defp reverser([], _),              do: []
  defp reverser([head|[]],   accum), do: [head | accum]
  defp reverser([head|tail], accum), do: reverser(tail, [head | accum])


  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map(l, f),  do: mapper(l,f) |> reverse
  defp mapper(list, func, acc \\ [])
  # defp mapper([], _, _), do: []
  defp mapper([head|[]],   func, accum), do: [func.(head) | accum]
  defp mapper([head|tail], func, accum), do: mapper(tail, func, [func.(head) | accum] )

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter(l, f),  do: filterer(l, f) |> reverse
  defp filterer(list, func, accum \\ [])
  # defp filterer([], _, _), do: []
  defp filterer([head|[]], func, accum) do
    cond do
      func.(head) -> [head | accum]
      true        -> accum
    end
  end
  defp filterer([head|tail], func, accum) do
    cond do
      func.(head) -> filterer(tail, func, [head | accum])
      true        -> filterer(tail, func, accum)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(list, acc \\ 0, func)
  def reduce([], _, _), do: 0
  def reduce(list, acc, func), do: reducer(list, acc, func)
  defp reducer([head|[]],   accum, func), do: func.(head, accum)
  defp reducer([head|tail], accum, func), do: reducer(tail, func.(head, accum), func)


  @spec append(list, list) :: list
  def append([], []),   do: []
  def append(list, []), do: list
  def append(first_list, list_2_append) do
    list_reversed = reverse(first_list)
    appender(list_2_append, list_reversed) |> reverse
  end
  defp appender(list_2_append, first_list_reversed)
  defp appender([], accum),          do: accum
  defp appender([head | []], accum), do: [head | accum]
  defp appender([head|tail], accum), do: appender(tail, [head | accum])


  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat(ll), do: concater(ll) |> reverse
  defp concater(list, accum \\ [])
  defp concater( [head | []], accum),   do: appender(head, accum)
  defp concater( [head | tail], accum), do: concater( tail, appender(head, accum) )

end
