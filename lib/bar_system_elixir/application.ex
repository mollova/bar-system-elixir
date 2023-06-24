defmodule BarSystemElixir.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BarSystemElixir.Repo,
      BarSystemElixir
    ]

    opts = [strategy: :one_for_one, name: BarSystemElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
