defmodule Primes do
  require Recurse

  def to(n) do
    for x <- Recurse.span(2, n), prime?(x), do: x
  end

  def prime?(1), do: true
  def prime?(2), do: true
  def prime?(n), do: _prime?(n, 2)
  defp _prime?(n, m) when m >= n, do: true
  defp _prime?(n, m) do
      rem(n, m) !== 0 and _prime?(n, m+1)
  end

end
