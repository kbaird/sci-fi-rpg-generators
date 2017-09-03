defmodule MindjammerWorldTest do
  use ExUnit.Case
  doctest MindjammerWorld

  test "make(:lost_colony) returns a map with a :high_concept" do
    assert(is_map(make(:lost_colony)))
    assert(Map.has_key?(make(:lost_colony), :high_concept))
  end
  test "make(:rediscovered) returns a map with a :high_concept" do
    assert(is_map(make(:rediscovered)))
    assert(Map.has_key?(make(:rediscovered), :high_concept))
  end
  test "make(:commonality) returns a map with a :high_concept" do
    assert(is_map(make(:commonality)))
    assert(Map.has_key?(make(:commonality), :high_concept))
  end
  test "make(:core) returns a map with a :high_concept" do
    assert(is_map(make(:core)))
    assert(Map.has_key?(make(:core), :high_concept))
  end

  defp make(inhabitation_type), do: MindjammerWorld.make(inhabitation_type)
end
