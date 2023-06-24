defmodule BarSystemElixir.Schemas.Cocktail do
  use Ecto.Schema

  alias BarSystemElixir.Repo

  import Ecto.Changeset
  import Ecto.Query

  schema "cocktails" do
    field :name, :string
    field :recipe, :string
    has_many :ingredients, BarSystemElixir.Schemas.Ingredient
  end

  def changeset(cocktail, params \\ %{}) do
    cocktail
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
