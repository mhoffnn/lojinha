defmodule Lojinha.Controller.Product do
  alias Lojinha.Repo, as: DB

  import Ecto.Query

  @doc """
  	Iserir um produto no Banco

  	## Parameters

  	- name: Nome do produto
  	- price: Valor unitário do produto
  	- inventory: Quantidade do produto em estoque
  """
  # Lojinha.insert("banana", 4.99, 65)
  def insert(name, price, inventory) do
    product = %Lojinha.ProductModel{name: name, price: price, inventory: inventory}

    product
    |> DB.insert()
  end

  @doc """
  	Retorna um produto

  	## Parameters

  	- id_product: ID do produto
  """
  def read(id_product) do
    DB.one(
      Lojinha.ProductModel
      |> select([product], product)
      |> where([product], product.id == ^id_product)
    )
  end

  @doc """
  	Retorna todos os produtos
  """
  def read do
    DB.all(
      Lojinha.ProductModel
      |> select([product], product)
      |> order_by(asc: :inserted_at)
    )
  end

  @doc """
  	Atualiza os dados do produto

  	## Parameters

  	- id_product: ID do produto
  	- data: Struct com os dados a serem atualizados
  """
  def update(id_produto, data) do
    # Campos que podem ser atualizados
    allowed_fields = [:name, :price, :inventory]

    changes = Ecto.Changeset.cast(%Lojinha.ProductModel{id: id_produto}, data, allowed_fields)

    changes
    |> DB.update()
  end

  @doc """
  	Deletar um produto do Banco

  	## Parameters

  	- id_produto : ID do produto
  """
  def delete(id_produto) do
    %Lojinha.ProductModel{id: id_produto}
    |> DB.delete()
  end
end
