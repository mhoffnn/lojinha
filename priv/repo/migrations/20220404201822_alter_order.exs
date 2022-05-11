defmodule Lojinha.Repo.Migrations.AlterOrder do
  use Ecto.Migration

  def change do
    alter table(:pedido) do
      add(:total_price, :float)
    end
  end
end
