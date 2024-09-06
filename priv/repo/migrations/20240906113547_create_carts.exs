defmodule Publisher.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :amount, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
