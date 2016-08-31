defmodule Recurse do
  def mapsum(list, func), do: Enum.reduce(Enum.map(list, func), 0, &(&1 + &2))

  def max(list), do: _max(nil, list)
  defp _max(current, []), do: current
  defp _max(current, [head | tail]) when head >= current or is_nil(current), do: _max(head, tail)
  defp _max(current, [head | tail]) when head < current, do: _max(current, tail)

  def caesar([], _n), do: []
  def caesar([h | t], n)
    when(h+n <= ?z),
    do: [h+n | caesar(t, n)]
  def caesar([h | t], n)
    when(h+n > ?z),
    do: [h+n-?z+?a-1 | caesar(t, n)]

  def span(from, to), do: _span([], from, to)
  defp _span(list, from, to)
    when from > to,
    do: list
  defp _span(list, from, to)
    when from <= to,
    do: _span([to | list], from, to - 1)
end
