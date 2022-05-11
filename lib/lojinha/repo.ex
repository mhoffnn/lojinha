defmodule Lojinha.Repo do
  use Ecto.Repo,
    otp_app: :lojinha,
    adapter: Ecto.Adapters.SQLite3
end
