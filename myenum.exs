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


end
