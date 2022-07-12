defmodule KrumpnServerWeb.RecipeController do
  use KrumpnServerWeb, :controller

  def index(conn, _params) do
    recipes = KrumpnServer.Recipes.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    recipe = KrumpnServer.Recipes.get_recipe!(id)
    render(conn, "show.json", recipe: recipe)
  end
end
