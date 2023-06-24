defmodule BarSystemElixir.Bar do
  use Supervisor
  alias BarSystemElixir.Repo

  defp poolboy_config do
    [
      name: {:local, :bar},
      worker_module: BarSystemElixir.Barman,
      size: 5,
      max_overflow: 2
    ]
  end

  def start_link(_) do
    IO.puts("Starting bar")
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(_) do
    ingredients = :ets.new(:ingredients, [:named_table, :public])

    {:ok, res} = Repo.query("select name, quantity from ingredients")
    Enum.each(res.rows, fn [n, q] ->  :ets.insert(:ingredients, {n, q}) end)

    children = [
      :poolboy.child_spec(:bar, poolboy_config())
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end

  # def make_cocktail -> state save map for <pid, busy>
  def make_cocktail(cocktail) do
    ingredients = get_ingredients(cocktail)
    available = has_ingredients?(ingredients)

    if available do
      Enum.map(ingredients, fn ing ->
         [{ing, curr}] = :ets.lookup(:ingredients, ing)
         :ets.insert(:ingredients, {ing, curr - 1})
      end)

      :poolboy.transaction(:bar, fn pid ->
        GenServer.call(pid, {:make_cocktail, cocktail})
      end)
    else
      {:error, "Not enough ingredients to make this cocktail :("}
    end

  end

  defp get_ingredients(cocktail) do
    {:ok, res} = Repo.query("select id from cocktails where name = '#{cocktail}'")
    [[cocktail_id]] = Map.get(res, :rows)

    {:ok, res} = Repo.query("select name from ingredients where cocktail_id = #{cocktail_id}")
    [ingredients] = Map.get(res, :rows)

    ingredients
  end

  defp has_ingredients?(ingredients) do
    Enum.reduce(ingredients, true,
      fn ing, res ->
        [{_, curr}] = :ets.lookup(:ingredients, ing)
        res and curr > 0
    end)
  end

end
