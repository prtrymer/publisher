defmodule Publisher.Money.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :amount, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
