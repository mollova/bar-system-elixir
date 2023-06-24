import Config

config :bar_system_elixir,
   ecto_repos: [BarSystemElixir.Repo]

config :bar_system_elixir, BarSystemElixir.Repo,
  database: "bar_system_elixir",
  username: "mmollova",
  password: "",
  hostname: "localhost"
