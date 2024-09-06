defmodule Publisher.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
