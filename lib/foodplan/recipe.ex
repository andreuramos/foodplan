defmodule Foodplan.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipees" do
    field :name, :string
    field :category, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :category])
    |> validate_required([:name, :category])
  end
end
