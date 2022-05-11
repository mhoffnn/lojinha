defmodule Lojinha.MixProject do
  use Mix.Project

  def project do
    [
      app: :lojinha,
      version: "0.1.0",
      elixir: "~> 1.12.3",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env:
      cli_env_for(:test, [
        "coveralls",
        "coveralls.detail",
        "coveralls.html",
        "coveralls.json",
        "coveralls.post",
        "coveralls.github"
      ])
    ]
  end

  defp cli_env_for(env, tasks) do
    Enum.reduce(tasks, [], fn key, acc -> Keyword.put(acc, :"#{key}", env) end)
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ecto_sqlite3, :ecto],
      mod: {Lojinha.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sqlite3, "~> 0.7.4"},
      {:ecto, "~> 3.7"},
      {:excoveralls, "~> 0.14.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
