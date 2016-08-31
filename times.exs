defmodule Times do
  def once(n), do: n
  def twice(n), do: n * 2
  def triple(n), do: n * 3
  def quadrule(n), do: twice(twice(n))
end
