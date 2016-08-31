defmodule MyList do
  def sum(list), do: _sum(0, list)
  defp _sum(acc, []), do: acc
  defp _sum(acc, [h | t]), do: _sum(acc + h, t)

  def sum2([]), do: 0
  def sum2([h|t]), do: h + sum2(t)
end
