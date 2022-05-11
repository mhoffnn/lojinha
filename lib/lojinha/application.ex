defmodule Lojinha.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    IO.puts("Starting Repo")

    children = [
      Lojinha.Repo
    ]

    opts = [strategy: :one_for_one, name: Lojinha.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
