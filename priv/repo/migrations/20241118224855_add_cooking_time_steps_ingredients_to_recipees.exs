defmodule Foodplan.Repo.Migrations.AddCookingTimeStepsIngredientsToRecipees do
  use Ecto.Migration

  def change do
    alter table(:recipees) do
      add :cooking_time, :integer
      add :steps, :text
      add :ingredients, :text
    end
  end
end
