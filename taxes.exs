defmodule Taxes do
  @moduledoc """
  Cool module
  """
  @rates [NC: 0.075, TX: 0.08]
  @orders [
    [id: 123, ship_to: :NC, net_amount: 100.00],
    [id: 124, ship_to: :OK, net_amount: 35.50],
    [id: 125, ship_to: :TX, net_amount: 24.50],
    [id: 126, ship_to: :TX, net_amount: 44.80],
    [id: 127, ship_to: :NC, net_amount: 25.00],
    [id: 128, ship_to: :MA, net_amount: 10.00],
    [id: 129, ship_to: :CA, net_amount: 102.00],
    [id: 130, ship_to: :NC, net_amount: 50.00],
  ]

  def calculate do
    for order <- @orders, do: _calc(order, @rates[order[:ship_to]])
  end

  @doc """
  for fun
  """
  def no_dup? do
    order_ids = @orders |> Enum.map(fn order -> order[:id] end)
    order_ids
      |> Enum.map(fn id -> Enum.count(order_ids, &(&1 === id)) end)
      |> Enum.all?(fn id_count -> id_count === 1 end)
  end

  defp _calc(order, nil), do: order
  defp _calc(order, rate) do
    applied_tax = order[:net_amount] * rate
    Keyword.merge(order, [total_amount: order[:net_amount] + applied_tax])
  end


end
