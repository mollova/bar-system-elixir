defmodule BarSystemElixir.Repo do
  use Ecto.Repo,
    otp_app: :bar_system_elixir,
    adapter: Ecto.Adapters.Postgres
end
