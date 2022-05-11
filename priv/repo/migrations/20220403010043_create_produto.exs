defmodule Lojinha.Repo.Migrations.CreateProduto do
  use Ecto.Migration

  def change do
    create table(:product) do
      add(:name, :string)
      add(:price, :float)
      add(:inventory, :integer)
      timestamps()
    end
  end
end
