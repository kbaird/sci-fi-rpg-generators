defmodule GurpsWorldTest do
  use ExUnit.Case
  doctest GurpsWorld

  test "greets the world" do
    assert GurpsWorld.hello() == :world
  end
end
