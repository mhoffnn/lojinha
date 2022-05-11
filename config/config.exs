import Config

config :lojinha, Lojinha.Repo,
  adapter: Ecto.Adapters.SQLite3,
  database: "lojinha.db"

config :lojinha, ecto_repos: [Lojinha.Repo]
