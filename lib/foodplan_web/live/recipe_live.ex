defmodule FoodplanWeb.RecipeLive do
  use Phoenix.LiveView
  alias Foodplan.Recipe
  alias Foodplan.Repo

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :recipes, list_recipes())}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    recipe = Repo.get!(Recipe, id)
    {:ok, _} = Repo.delete(recipe)
    {:noreply, assign(socket, :recipes, list_recipes())}
  end

  def handle_event("save", %{"recipe" => recipe_params}, socket) do
    changeset = Recipe.changeset(%Recipe{}, recipe_params)

    if changeset.valid? do
      Repo.insert!(changeset)
      {:noreply, assign(socket, :recipes, list_recipes())}
    else
      {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  def handle_event("update", %{"id" => id, "recipe" => recipe_params}, socket) do
    recipe = Repo.get!(Recipe, id)
    changeset = Recipe.changeset(recipe, recipe_params)

    if changeset.valid? do
      Repo.update!(changeset)
      {:noreply, assign(socket, :recipes, list_recipes())}
    else
      {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp list_recipes do
    Repo.all(Recipe)
  end
end
