defmodule Lojinha.ProductModel do
  use Ecto.Schema

  schema "product" do
    field(:name, :string)
    field(:price, :float)
    field(:inventory, :integer)
    timestamps()
  end
end
