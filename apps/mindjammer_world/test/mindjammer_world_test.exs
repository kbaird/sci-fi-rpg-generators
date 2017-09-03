defmodule MindjammerWorldTest do
  use ExUnit.Case
  doctest MindjammerWorld

  test "greets the world" do
    assert MindjammerWorld.hello() == :world
  end
end
