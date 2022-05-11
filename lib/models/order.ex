defmodule Lojinha.OrderModel do
  use Ecto.Schema

  import Lojinha.ProductModel

  schema "order" do
    field(:id_product, :integer)
    field(:id_client, :integer)
    field(:amount, :integer)
    field(:total_price, :float)
    field(:type_payment, :string)
    field(:is_finalized, :boolean)
    timestamps()
  end
end
