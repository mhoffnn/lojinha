defmodule Lojinha.ClientModel do
  use Ecto.Schema

  schema "client" do
    field(:name, :string)
    field(:age, :integer)
    timestamps()
  end
end
