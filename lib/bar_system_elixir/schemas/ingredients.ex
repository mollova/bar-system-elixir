defmodule BarSystemElixir.Schemas.Ingredient do
  use Ecto.Schema

  schema "ingredients" do
    field :name, :string
    field :quantity, :integer

    belongs_to :cocktail, BarSystemElixir.Schemas.Cocktail
  end

end
