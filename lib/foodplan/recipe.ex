defmodule Foodplan.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipees" do
    field :name, :string
    field :category, :string
    field :cooking_time, :integer
    field :steps, :string
    field :ingredients, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :category, :cooking_time, :steps, :ingredients])
    |> validate_required([:name, :category, :cooking_time, :steps, :ingredients])
  end
end
