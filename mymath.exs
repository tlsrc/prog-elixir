defmodule MyMath do
  def fact(0), do: 1
  def fact(n) when n > 0, do: n * fact(n-1)
  def fact(n) when n < 0, do: raise "Cannot compute factorial of negative number"

  def sum(0), do: 0
  def sum(n) when n> 0, do: n + sum(n-1)

  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y, rem(x,y))
end
