defmodule Lojinha.Repo.Migrations.AlterTableNamePedidoToOrder do
  use Ecto.Migration

  def change do
    rename table(:pedido), to: table(:order)
  end
end
