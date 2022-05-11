defmodule Lojinha.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:pedido) do
      add(:id_product, :integer)
      add(:id_cliente, :integer)
      add(:amount, :integer)
      timestamps()
    end
  end
end
