defmodule MindjammerWorldTest do
  use ExUnit.Case
  doctest MindjammerWorld

  test "make(:lost_colony) returns a map" do
    assert(is_map(MindjammerWorld.make(:lost_colony)))
  end
  test "make(:rediscovered) returns a map" do
    assert(is_map(MindjammerWorld.make(:rediscovered)))
  end
  test "make(:commonality) returns a map" do
    assert(is_map(MindjammerWorld.make(:commonality)))
  end
  test "make(:core) returns a map" do
    assert(is_map(MindjammerWorld.make(:core)))
  end
end
