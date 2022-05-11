defmodule Lojinha.Controller.Client do
  alias Lojinha.Repo, as: DB

  import Ecto.Query

  @doc """
  	Iserir um cliente no Banco

  	## Parameters

  	- name: Nome do indivíduo
  	- age: Idade do indivíduo
  """
  def insert(name, age) do
    client = %Lojinha.ClientModel{name: name, age: age}

    client
    |> DB.insert()
  end

  @doc """
  	Retorna um cliente

  	## Parameters

  	- id_cliente: ID do cliente
  """
  def read_by_id(id_client) do
    DB.one(
      Lojinha.ClientModel
      |> select([client], client)
      |> where([client], client.id == ^id_client)
    )
  end

  @doc """
  	Retorna um cliente pelo seu nome

  	## Parameters

  	- name: nome do cliente
  """
  def read_by_name(name) do
    DB.one(
      Lojinha.ClientModel
      |> select([client], client)
      |> where([client], client.name == ^name)
    )
  end

  @doc """
  	Retorna todos os clientes
  """
  def read do
    DB.all(
      Lojinha.ClientModel
      |> select([client], client)
      |> order_by(desc: :inserted_at)
    )
  end

  @doc """
  	Atualiza os dados do cliente

  	## Parameters

  	- id_client: ID do cliente
  	- data: Struct com os dados a serem atualizados
  """
  def update(id_client, data) do
    # Campos que podem ser atualizados
    allowed_fields = [:name, :age]

    changes = Ecto.Changeset.cast(%Lojinha.ClientModel{id: id_client}, data, allowed_fields)

    changes
    |> DB.update()
  end

  @doc """
  	Deletar um cliente do Banco

  	## Parameters

  	- id_client : ID do produto
  """
  def delete(id_client) do
    %Lojinha.ClientModel{id: id_client}
    |> DB.delete()
  end
end
