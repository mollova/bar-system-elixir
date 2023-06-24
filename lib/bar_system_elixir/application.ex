defmodule BarSystemElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  # @registry :bars_registry

  @impl true
  def start(_type, _args) do
    children = [
      BarSystemElixir.Repo,
      BarSystemElixir
      # {Registry, [keys: :unique, name: @registry]}
    ]

    opts = [strategy: :one_for_one, name: BarSystemElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
