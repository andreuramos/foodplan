defmodule Foodplan.Repo.Migrations.CreateRecipees do
  use Ecto.Migration

  def change do
    create table(:recipees) do
      add :name, :string
      add :category, :string

      timestamps(type: :utc_datetime)
    end
  end
end
