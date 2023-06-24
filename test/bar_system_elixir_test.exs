defmodule BarSystemElixirTest do
  use ExUnit.Case
  doctest BarSystemElixir

  test "greets the world" do
    assert BarSystemElixir.hello() == :world
  end
end
