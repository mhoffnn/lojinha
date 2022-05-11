defmodule Lojinha.Repo.Migrations.AddColumnTypePaymentAndIsFinalizedInOrder do
  use Ecto.Migration

  def change do
    alter table(:order) do
      add(:type_payment, :String)
      add(:is_finalized, :boolean, default: false)
    end
  end
end
