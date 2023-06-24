defmodule BarSystemElixir.User do
  use GenServer

  def start_link(_) do
    IO.puts("Starting user")
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    {:ok, []}
  end

  def ask_for_cocktail(cocktail) do
    BarSystemElixir.Bar.make_cocktail(cocktail)
  end

end
