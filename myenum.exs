defmodule MyEnum do
  def all?([], _f), do: true
  def all?([h|t], f), do: f.(h) and all?(t, f)
end
