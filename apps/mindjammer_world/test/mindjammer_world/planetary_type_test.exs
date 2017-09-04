defmodule MindjammerWorldPlanetaryTypeTest do
  use ExUnit.Case
  alias MindjammerWorld.Worker

  describe "planetary_type (inhabited)" do
    test "is {:non_garden_world, -4} when given -4, :inhabited" do
      assert(Worker.planetary_type(-4, :inhabited) == {:non_garden_world, -4})
    end
    test "is {:marginal_garden_world, -2} when given -3/-2, :inhabited" do
      assert(Worker.planetary_type(-3, :inhabited) == {:marginal_garden_world, -2})
      assert(Worker.planetary_type(-2, :inhabited) == {:marginal_garden_world, -2})
    end
    test "is {:inferior_garden_world, 0} when given -1/0/1, :inhabited" do
      assert(Worker.planetary_type(-1, :inhabited) == {:inferior_garden_world, 0})
      assert(Worker.planetary_type(0,  :inhabited) == {:inferior_garden_world, 0})
      assert(Worker.planetary_type(1,  :inhabited) == {:inferior_garden_world, 0})
    end
    test "is {:standard_garden_world, 2} when given 2/3, :inhabited" do
      assert(Worker.planetary_type(2, :inhabited) == {:standard_garden_world, 2})
      assert(Worker.planetary_type(3, :inhabited) == {:standard_garden_world, 2})
    end
    test "is {:superior_garden_world, 4} when given 4, :inhabited" do
      assert(Worker.planetary_type(4, :inhabited) == {:superior_garden_world, 4})
    end
  end
end
