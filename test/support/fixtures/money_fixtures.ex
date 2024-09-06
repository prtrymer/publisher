defmodule Publisher.MoneyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Publisher.Money` context.
  """

  @doc """
  Generate a cart.
  """
  def cart_fixture(attrs \\ %{}) do
    {:ok, cart} =
      attrs
      |> Enum.into(%{
        amount: 42
      })
      |> Publisher.Money.create_cart()

    cart
  end
end
