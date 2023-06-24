defmodule BarSystemElixir.Schemas.Ingredient do
  use Ecto.Schema

  alias BarSystemElixir.Repo

  import Ecto.Changeset
  import Ecto.Query

  schema "ingredients" do
    field :name, :string
    field :quantity, :integer

    belongs_to :cocktail, BarSystemElixir.Schemas.Cocktail
  end

  def changeset(ingredient, params \\ %{}) do
    ingredient
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
