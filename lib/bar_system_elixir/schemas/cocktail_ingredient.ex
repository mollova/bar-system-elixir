defmodule BarSystemElixir.Schemas.CocktailIngredient do
  use Ecto.Schema

  schema "cocktails_ingredients" do
    belongs_to(:cocktail, BarSystemElixir.Schemas.Cocktail)
    belongs_to(:ingredient, BarSystemElixir.Schemas.Ingredient)
  end
end
