defmodule MindjammerWorldCivilisationTypeTest do
  use ExUnit.Case
  alias MindjammerWorld.Worker

  describe "civilisation_type" do
    test "when given -8/-7, :lost_colony is :failing" do
      assert(Worker.civilisation_type(-8, :lost_colony) == :failing)
      assert(Worker.civilisation_type(-7, :lost_colony) == :failing)
    end

    test "when given -8, :rediscovered is :failing" do
      assert(Worker.civilisation_type(-8, :rediscovered) == :failing)
    end

    test "when given -8, :commonality is :failing" do
      assert(Worker.civilisation_type(-8, :commonality) == :failing)
    end

    test "when given -8, :core is :prison_closed_world" do
      assert(Worker.civilisation_type(-8, :core) == :"prison/closed_world")
    end
  end
end
