defmodule BarSystemElixir.Schemas.Cocktail do
  use Ecto.Schema

  schema "cocktails" do
    field :name, :string
    field :recipe, :string
    has_many :ingredients, BarSystemElixir.Schemas.Ingredient
  end
end
