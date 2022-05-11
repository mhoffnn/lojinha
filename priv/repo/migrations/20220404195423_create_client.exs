defmodule Lojinha.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:client) do
      add(:name, :string)
      add(:age, :integer)
      timestamps()
    end
  end
end
