defmodule BarSystemElixir.Barman do
  use GenServer

  def start_link(_) do
    IO.puts("Starting barman")
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    {:ok, []}
  end

  def handle_call({:make_cocktail, cocktail}, _from, state) do
    IO.puts("Making cocktail #{cocktail}.. 🍹")
    Process.sleep(1000)

    IO.puts("Adding ice.. 🧊")
    Process.sleep(500)

    IO.puts("Decorating with lemon.. 🍋")
    Process.sleep(500)

    IO.puts("Enjoy! 😉")
    {:reply, "ready", state}
  end

  def make_cocktail(cocktail) do

  end

end


# BarSystemElixir.Barman.start_link("cd")
# BarSystemElixir.Barman.make_cocktail("magic")
