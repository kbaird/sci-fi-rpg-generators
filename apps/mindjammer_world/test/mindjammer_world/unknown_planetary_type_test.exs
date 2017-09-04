defmodule MindjammerWorldUnknownPlanetaryTypeTest do
  use ExUnit.Case
  alias MindjammerWorld.Worker

  describe "planetary_type (unknown, inner system)" do
    test "when given -8/-7, :inner_system is :accretion_disk" do
      assert(Worker.planetary_type(-8, :inner_system) == :accretion_disk)
      assert(Worker.planetary_type(-7, :inner_system) == :accretion_disk)
    end
    test "when given -6/-5, :inner_system is :protoplanet" do
      assert(Worker.planetary_type(-6, :inner_system) == :proto_planet)
      assert(Worker.planetary_type(-5, :inner_system) == :proto_planet)
    end
    test "when given -4/6, :inner_system is :gas_giant" do
      assert(Worker.planetary_type(-4, :inner_system) == :gas_giant)
      assert(Worker.planetary_type(6,  :inner_system) == :gas_giant)
    end
    test "when given -3/1, :inner_system is :inferno" do
      assert(Worker.planetary_type(-3, :inner_system) == :inferno)
      assert(Worker.planetary_type(1,  :inner_system) == :inferno)
    end
    test "when given -2/0/2/5, :inner_system is :terrestrial" do
      assert(Worker.planetary_type(-2, :inner_system) == :terrestrial)
      assert(Worker.planetary_type(0,  :inner_system) == :terrestrial)
      assert(Worker.planetary_type(2,  :inner_system) == :terrestrial)
      assert(Worker.planetary_type(5,  :inner_system) == :terrestrial)
    end
    test "when given -1/4, :inner_system is :desert_world" do
      assert(Worker.planetary_type(-1, :inner_system) == :desert_world)
      assert(Worker.planetary_type(4,  :inner_system) == :desert_world)
    end
    test "when given 3, :inner_system is :marginal_garden_world" do
      assert(Worker.planetary_type(3, :inner_system) == :marginal_garden_world)
    end
    test "when given 7, :inner_system is :cthonian" do
      assert(Worker.planetary_type(7, :inner_system) == :cthonian)
    end
    test "when given 8, :inner_system is :carbon" do
      assert(Worker.planetary_type(8, :inner_system) == :carbon_planet)
    end
  end

  describe "planetary_type (unknown, h_zone)" do
    test "when given -8/-7, :h_zone is :accretion_disk" do
      assert(Worker.planetary_type(-8, :h_zone) == :accretion_disk)
      assert(Worker.planetary_type(-7, :h_zone) == :accretion_disk)
    end
    test "when given -6/-5, :h_zone is :protoplanet" do
      assert(Worker.planetary_type(-6, :h_zone) == :proto_planet)
      assert(Worker.planetary_type(-5, :h_zone) == :proto_planet)
    end
    test "when given -4, :h_zone is :desert_world" do
      assert(Worker.planetary_type(-4, :h_zone) == :desert_world)
    end
    test "when given -3, :h_zone is :ocean_world" do
      assert(Worker.planetary_type(-3, :h_zone) == :ocean_world)
    end
    test "when given -2/0/2/5, :h_zone is :terrestrial" do
      assert(Worker.planetary_type(-2, :h_zone) == :terrestrial)
      assert(Worker.planetary_type(0,  :h_zone) == :terrestrial)
      assert(Worker.planetary_type(2,  :h_zone) == :terrestrial)
    end
    test "when given -1/7, :h_zone is :marginal_garden_world" do
      assert(Worker.planetary_type(-1, :h_zone) == :marginal_garden_world)
      assert(Worker.planetary_type(7,  :h_zone) == :marginal_garden_world)
    end
    test "when given 1, :h_zone is :standard_garden_world" do
      assert(Worker.planetary_type(1, :h_zone) == :standard_garden_world)
    end
    test "when given 3, :h_zone is :superior_garden_world" do
      assert(Worker.planetary_type(3, :h_zone) == :superior_garden_world)
    end
    test "when given 4, :h_zone is :super_earth" do
      assert(Worker.planetary_type(4, :h_zone) == :super_earth)
    end
    test "when given 5, :h_zone is :gas_giant" do
      assert(Worker.planetary_type(5, :h_zone) == :gas_giant)
    end
    test "when given 8, :h_zone is :post-garden_world" do
      assert(Worker.planetary_type(8, :h_zone) == :"post-garden_world")
    end
  end

  describe "planetary_type (unknown, outer_system)" do
    test "when given -8/-7, :outer_system is :accretion_disk" do
      assert(Worker.planetary_type(-8, :outer_system) == :accretion_disk)
      assert(Worker.planetary_type(-7, :outer_system) == :accretion_disk)
    end
    test "when given -6/-5, :outer_system is :proto_gas_giant" do
      assert(Worker.planetary_type(-6, :outer_system) == :proto_gas_giant)
      assert(Worker.planetary_type(-5, :outer_system) == :proto_gas_giant)
    end
    test "when given -4, :outer_system is :iceball" do
      assert(Worker.planetary_type(-4, :outer_system) == :iceball)
    end
    test "when given -3/0/1, :outer_system is :gas_giant" do
      assert(Worker.planetary_type(-3, :outer_system) == :gas_giant)
      assert(Worker.planetary_type(0,  :outer_system) == :gas_giant)
      assert(Worker.planetary_type(1,  :outer_system) == :gas_giant)
    end
    test "when given -2/2, :outer_system is :ice_giant" do
      assert(Worker.planetary_type(-2, :outer_system) == :ice_giant)
      assert(Worker.planetary_type(2,  :outer_system) == :ice_giant)
    end
    test "when given -1, :outer_system is :dwarf_planet" do
      assert(Worker.planetary_type(-1, :outer_system) == :dwarf_planet)
    end
    test "when given 3, :outer_system is :asteroid_belt" do
      assert(Worker.planetary_type(3, :outer_system) == :asteroid_belt)
    end
    test "when given 4, :outer_system is :marginal_garden_moon_of_gas_giant" do
      assert(Worker.planetary_type(4, :outer_system) == :marginal_garden_moon_of_gas_giant)
    end
    test "when given 5, :outer_system is :rogue_planet" do
      assert(Worker.planetary_type(5, :outer_system) == :rogue_planet)
    end
    test "when given 6, :outer_system is :helium_planet" do
      assert(Worker.planetary_type(6, :outer_system) == :helium_planet)
    end
    test "when given 7/8, :outer_system is :carbon_planet" do
      assert(Worker.planetary_type(7, :outer_system) == :carbon_planet)
      assert(Worker.planetary_type(8, :outer_system) == :carbon_planet)
    end
  end
end
