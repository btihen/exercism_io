defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  # def keep(list, fun) do
  #   Enum.filter(list, fun)
  # end
  def keep(list, func) do
    filter(list, func, [])
  end

  defp get_answer(false, _, curr_answer),     do: curr_answer
  defp get_answer(true,  input, curr_answer), do: curr_answer ++ [input]

  defp filter([], _, _), do: []
  defp filter([head | []], func, curr_answer) do
    func_eval = func.(head)
    get_answer(func_eval, head, curr_answer)
  end
  defp filter([head | tail], func, curr_answer) do
    func_eval = func.(head)
    new_answer = get_answer(func_eval, head, curr_answer)
    filter(tail, func, new_answer)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  # def discard(list, fun) do
  #   Enum.reject(list, fun)
  # end
  def discard(list, func) do
    not_filter(list, func, [])
  end

  defp not_filter([], _, _), do: []
  defp not_filter([head | []], func, curr_answer) do
    func_eval = !(func.(head))
    get_answer(func_eval, head, curr_answer)
    # not_answer(func_eval, head, curr_answer)
  end
  defp not_filter([head | tail], func, curr_answer) do
    func_eval = !(func.(head))
    new_answer = get_answer(func_eval, head, curr_answer)
    # new_answer = not_answer(func_eval, head, curr_answer)
    not_filter(tail, func, new_answer)
  end

end
