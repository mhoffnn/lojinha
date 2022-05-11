defmodule Lojinha.Repo.Migrations.AlterColumNameIdClienteToIdClientInOrder do
  use Ecto.Migration

  def change do
    rename table(:order), :id_cliente, to: :id_client
  end
end
