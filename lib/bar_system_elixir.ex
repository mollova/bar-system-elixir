defmodule BarSystemElixir do
  use DynamicSupervisor

  def start_link(_) do
    IO.puts("Starting bars")
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_init_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_bars_supervisor() do
    IO.puts("Starting bar emag")
    DynamicSupervisor.start_child(__MODULE__, {BarSystemElixir.Bar, []})
  end

  def start_users_supervisor() do
    IO.puts("Starting user 1")
    DynamicSupervisor.start_child(__MODULE__, {BarSystemElixir.User, []})
  end

end
