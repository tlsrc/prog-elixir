defmodule Chop do

  def guess(actual, min..max) do
    middle = min + div(max-min, 2)
    IO.puts "Is it #{middle}?"
    _guess(actual, middle, min..max)
  end

  defp _guess(actual, actual, _) do
    IO.puts "Found #{actual}"
  end

  defp _guess(actual, current_guess, _min..max)
    when current_guess < actual
    do
      guess(actual, current_guess..max)
  end

  defp _guess(actual, current_guess, min.._max)
    when current_guess > actual
    do
      guess(actual, min..current_guess)
  end

end
