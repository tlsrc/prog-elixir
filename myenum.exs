defmodule MyEnum do
  def all?([], _f), do: true
  def all?([h|t], f), do: f.(h) and all?(t, f)

  def each([], _f), do: nil
  def each([h|t], f) do
    f.(h)
    each(t, f)
  end

  def filter(list, predicate), do: _filter([], list, predicate)
  defp _filter(m, [], _p), do: Enum.reverse(m)
  defp _filter(m, [h|t], p) do
    if(p.(h)) do
      _filter([h | m], t, p )
    else
      _filter(m, t, p)
    end
  end

  def split(list, count) when count >= 0, do: _split([], list, count)
  def split(list, count) when count < 0, do: _split_reverse([], Enum.reverse(list), -count)
  defp _split(a, b, 0), do: {Enum.reverse(a), b}
  defp _split(a, [h|t], c), do: _split([h|a], t, c-1)
  defp _split_reverse(a, b, 0), do: {Enum.reverse(b), a}
  defp _split_reverse(a, [h|t], c), do: _split_reverse([h|a], t, c-1)




end
