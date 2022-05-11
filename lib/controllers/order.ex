defmodule Lojinha.Controller.Order do
  alias Lojinha.Repo, as: DB

  import Ecto.Query
  alias Lojinha.Controller.Product
  alias Lojinha.Controller.Order

  @doc """
  	Iserir um pedido no Banco

  	## Parameters

  	- id_product: ID do produto
  	- id_client: ID do cliente
  	- amount: Quantidade do produto
  """
  def insert(id_product, id_client, amount) do
    order = %Lojinha.OrderModel{
      id_product: id_product,
      id_client: id_client,
      amount: amount,
      total_price: total_price(id_product, amount)
    }

    order
    |> DB.insert()
  end

  @doc """
  	Retorna um pedido

  	## Parameters

  	- id_order: ID do pedido
  """
  def read(id_order) do
    DB.one(
      Lojinha.OrderModel
      |> select([order], order)
      |> where([order], order.id == ^id_order)
    )
  end

  @doc """
  	Retorna o pedido de um cliente

  	## Parameters

    - id_order: ID do pedido

    ## Exemple

    Lojinha.Order.read_by_client(8)
  """
  def read_by_client(id_client) do
    DB.all(
      from(order in Lojinha.OrderModel,
        join: product in Lojinha.ProductModel,
        on: order.id_product == product.id,
        select: [
          order.id,
          order.id_client,
          product.name,
          sum(order.amount),
          sum(order.total_price)
        ],
        where: order.id_client == ^id_client,
        group_by: order.id_product
      )
    )
    |> Enum.map(fn x ->
      %{
        id: Enum.at(x, 0),
        id_client: Enum.at(x, 1),
        name_product: Enum.at(x, 2),
        amount: Enum.at(x, 3),
        total_price: Enum.at(x, 4)
      }
    end)
  end

  @doc """
  	Retorna todos os pedidos
  """
  def read do
    DB.all(
      Lojinha.OrderModel
      |> select([order], order)
      |> order_by(asc: :inserted_at)
    )
  end

  @doc """
  	Atualiza os dados de um pedido

  	## Parameters

  	- id_order: ID do pedido
  	- amount: Quantidade a ser atualizada
  """
  def update(id_order, amount) do
    # Campos que podem ser atualizados
    allowed_fields = [:amount, :total_price]

    data = %{
      amount: amount,
      total_price: total_price(Order.read(id_order).id_product, amount)
    }

    changes = Ecto.Changeset.cast(%Lojinha.OrderModel{id: id_order}, data, allowed_fields)

    changes
    |> DB.update()
  end

  @doc """
  	Deletar um pedido do Banco

  	## Parameters

  	- id_order: ID do pedido
  """
  def delete(id_order) do
    %Lojinha.OrderModel{id: id_order}
    |> DB.delete()
  end

  defp total_price(id_product, amount) do
    product =
      Product.read(id_product)
      |> IO.inspect()

    Float.floor(product.price * amount, 2)
  end

  def finalization(type_payment, id) do
    # Campos que podem ser atualizados
    allowed_fields = [:type_payment, :is_finalized]

    data = %{
      type_payment: type_payment,
      is_finalized: true
    }

    changes = Ecto.Changeset.cast(%Lojinha.OrderModel{id: id}, data, allowed_fields)

    changes
    |> DB.update()
  end
end
