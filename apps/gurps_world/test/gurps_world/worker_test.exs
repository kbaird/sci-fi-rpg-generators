defmodule GurpsWorldWorkerTest do
  use ExUnit.Case
  doctest GurpsWorld.Worker

  describe "world_type" do
    test "is :hostile when given 7" do
      assert(GurpsWorld.Worker.world_type(7) == :hostile)
    end
    test "is :barren when given 8" do
      assert(GurpsWorld.Worker.world_type(8) == :barren)
    end
    test "is :barren when given 13" do
      assert(GurpsWorld.Worker.world_type(13) == :barren)
    end
    test "is :garden when given 14" do
      assert(GurpsWorld.Worker.world_type(14) == :garden)
    end
  end

end
