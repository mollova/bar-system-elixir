defmodule BarSystemElixir.Repo.Migrations.Bar do
  use Ecto.Migration

  def change do
    create table(:cocktails) do
      add :name, :string, size: 20
      add :recipe, :string, size: 200
    end

    create table(:ingredients) do
      add :name, :string, size: 20
      add :quantity, :integer
      add :cocktail_id, references(:cocktails)
    end

  end
end
