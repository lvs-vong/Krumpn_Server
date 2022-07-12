defmodule KrumpnServer.RecipesTest do
  use KrumpnServer.DataCase

  alias KrumpnServer.Recipes

  describe "recipes" do
    alias KrumpnServer.Recipes.Recipe

    import KrumpnServer.RecipesFixtures

    @invalid_attrs %{description: nil, directions: nil, name: nil, num_calories: nil, num_servings: nil, prep_time: nil}

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Recipes.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Recipes.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      valid_attrs = %{description: "some description", directions: [], name: "some name", num_calories: 120.5, num_servings: 42, prep_time: 42}

      assert {:ok, %Recipe{} = recipe} = Recipes.create_recipe(valid_attrs)
      assert recipe.description == "some description"
      assert recipe.directions == []
      assert recipe.name == "some name"
      assert recipe.num_calories == 120.5
      assert recipe.num_servings == 42
      assert recipe.prep_time == 42
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      update_attrs = %{description: "some updated description", directions: [], name: "some updated name", num_calories: 456.7, num_servings: 43, prep_time: 43}

      assert {:ok, %Recipe{} = recipe} = Recipes.update_recipe(recipe, update_attrs)
      assert recipe.description == "some updated description"
      assert recipe.directions == []
      assert recipe.name == "some updated name"
      assert recipe.num_calories == 456.7
      assert recipe.num_servings == 43
      assert recipe.prep_time == 43
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_recipe(recipe, @invalid_attrs)
      assert recipe == Recipes.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Recipes.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Recipes.change_recipe(recipe)
    end
  end
end
