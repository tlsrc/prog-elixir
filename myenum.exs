defmodule MyEnum do
  def all?([], _f), do: true
  def all?([h|t], f), do: f.(h) and all?(t, f)

  def each([], _f), do: nil
  def each([h|t], f) do
    f.(h)
    each(t, f)
  end

  def filter(enum, predicate), do: _filter([], enum, predicate)
  defp _filter(m, [], _p), do: Enum.reverse(m)
  defp _filter(m, [h|t], p) do
    if(p.(h)) do
      _filter([h | m], t, p )
    else
      _filter(m, t, p)
    end
  end

  def split(enum, count) when count >= 0, do: _split([], enum, count)
  def split(enum, count) when count < 0, do: _split_reverse([], Enum.reverse(enum), -count)
  defp _split(a, b, 0), do: {Enum.reverse(a), b}
  defp _split(a, [h|t], c), do: _split([h|a], t, c-1)
  defp _split_reverse(a, b, 0), do: {Enum.reverse(b), a}
  defp _split_reverse(a, [h|t], c), do: _split_reverse([h|a], t, c-1)

  def take(enum, count) when count >= 0, do: _take([], enum, count)
  def take(enum, count) when count < 0, do: _take_reverse([], Enum.reverse(enum), -count)
  defp _take(acc, _enum, 0), do: Enum.reverse(acc)
  defp _take(acc, [h|t], c), do: _take([h|acc], t, c-1)
  defp _take_reverse(acc, _enum, 0), do: acc
  defp _take_reverse(acc, [h|t], c), do: _take_reverse([h|acc], t, c-1)


end
