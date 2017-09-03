defmodule MindjammerWorldPlanetaryTypeTest do
  use ExUnit.Case
  alias MindjammerWorld.Worker

  describe "planetary_type" do
    test "is {:non_garden_world, -4} when given -4" do
      assert(Worker.planetary_type(-4) == {:non_garden_world, -4})
    end
    test "is {:marginal_garden_world, -2} when given -3 or -2" do
      assert(Worker.planetary_type(-3) == {:marginal_garden_world, -2})
      assert(Worker.planetary_type(-2) == {:marginal_garden_world, -2})
    end
    test "is {:inferior_garden_world, 0} when given -1, 0 or 1" do
      assert(Worker.planetary_type(-1) == {:inferior_garden_world, 0})
      assert(Worker.planetary_type(0)  == {:inferior_garden_world, 0})
      assert(Worker.planetary_type(1)  == {:inferior_garden_world, 0})
    end
    test "is {:standard_garden_world, 2} when given 2 or 3" do
      assert(Worker.planetary_type(2) == {:standard_garden_world, 2})
      assert(Worker.planetary_type(3) == {:standard_garden_world, 2})
    end
    test "is {:superior_garden_world, 4} when given 4" do
      assert(Worker.planetary_type(4) == {:superior_garden_world, 4})
    end
  end
end
