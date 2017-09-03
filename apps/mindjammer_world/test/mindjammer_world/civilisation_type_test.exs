defmodule MindjammerWorldCivilisationTypeTest do
  use ExUnit.Case
  alias MindjammerWorld.Worker

  describe "civilisation_type" do
    test "when given -8/-7/5, :lost_colony is :failing" do
      assert(Worker.civilisation_type(-8, :lost_colony) == :failing)
      assert(Worker.civilisation_type(-7, :lost_colony) == :failing)
      assert(Worker.civilisation_type(5,  :lost_colony) == :failing)
    end
    test "when given -6/-5/2, :lost_colony is :regressed" do
      assert(Worker.civilisation_type(-6, :lost_colony) == :regressed)
      assert(Worker.civilisation_type(-5, :lost_colony) == :regressed)
      assert(Worker.civilisation_type(2,  :lost_colony) == :regressed)
    end
    test "when given -4, :lost_colony is :alien_civilisation" do
      assert(Worker.civilisation_type(-4, :lost_colony) == :alien_civilisation)
    end
    test "when given -3, :lost_colony is :holdout" do
      assert(Worker.civilisation_type(-3, :lost_colony) == :holdout)
    end
    test "when given -2, :lost_colony is :industrial_world" do
      assert(Worker.civilisation_type(-2, :lost_colony) == :industrial_world)
    end
    test "when given -1, 0, 1, :lost_colony is :balkanised_world" do
      assert(Worker.civilisation_type(-1, :lost_colony) == :balkanised)
      assert(Worker.civilisation_type(0,  :lost_colony) == :balkanised)
      assert(Worker.civilisation_type(1,  :lost_colony) == :balkanised)
    end
    test "when given 3, :lost_colony is :agri_world" do
      assert(Worker.civilisation_type(3, :lost_colony) == :agri_world)
    end
    test "when given 4, :lost_colony is :united_world" do
      assert(Worker.civilisation_type(4, :lost_colony) == :united_world)
    end
    test "when given 6, :lost_colony is :high_population_world" do
      assert(Worker.civilisation_type(6, :lost_colony) == :high_population_world)
    end
    test "when given 7, :lost_colony is :interstellar_civilisation" do
      assert(Worker.civilisation_type(7, :lost_colony) == :interstellar_civilisation)
    end
    test "when given 8, :lost_colony is :interstellar_hub" do
      assert(Worker.civilisation_type(8, :lost_colony) == :interstellar_hub)
    end

    test "when given -8, :rediscovered is :failing" do
      assert(Worker.civilisation_type(-8, :rediscovered) == :failing)
    end
    test "when given -7/-6/-5/2, :rediscovered is :regressed" do
      assert(Worker.civilisation_type(-7, :rediscovered) == :regressed)
      assert(Worker.civilisation_type(-6, :rediscovered) == :regressed)
      assert(Worker.civilisation_type(-5, :rediscovered) == :regressed)
      assert(Worker.civilisation_type(2,  :rediscovered) == :regressed)
    end
    test "when given -4/-3, :rediscovered is :holdout" do
      assert(Worker.civilisation_type(-4, :rediscovered) == :holdout)
      assert(Worker.civilisation_type(-3, :rediscovered) == :holdout)
    end
    test "when given -2, :rediscovered is :industrial_world" do
      assert(Worker.civilisation_type(-2, :rediscovered) == :industrial_world)
    end
    test "when given -1/1, :rediscovered is :balkanised_world" do
      assert(Worker.civilisation_type(-1, :rediscovered) == :balkanised)
      assert(Worker.civilisation_type(1,  :rediscovered) == :balkanised)
    end
    test "when given 0, :rediscovered is :united_world" do
      assert(Worker.civilisation_type(0, :rediscovered) == :united_world)
    end
    test "when given 3, :rediscovered is :agri_world" do
      assert(Worker.civilisation_type(3, :rediscovered) == :agri_world)
    end
    test "when given 4/5, :rediscovered is :culture_world" do
      assert(Worker.civilisation_type(4, :rediscovered) == :culture_world)
      assert(Worker.civilisation_type(5, :rediscovered) == :culture_world)
    end
    test "when given 6, :rediscovered is :high_population_world" do
      assert(Worker.civilisation_type(6, :rediscovered) == :high_population_world)
    end
    test "when given 7, :rediscovered is :interstellar_civilisation" do
      assert(Worker.civilisation_type(7, :rediscovered) == :interstellar_civilisation)
    end
    test "when given 8, :rediscovered is :interstellar_hub" do
      assert(Worker.civilisation_type(8, :rediscovered) == :interstellar_hub)
    end

    test "when given -8, :commonality is :failing" do
      assert(Worker.civilisation_type(-8, :commonality) == :failing)
    end
    test "when given -7/5, :commonality is :instrumentality_hub" do
      assert(Worker.civilisation_type(-7, :commonality) == :instrumentality_hub)
      assert(Worker.civilisation_type(5,  :commonality) == :instrumentality_hub)
    end
    test "when given -6, :commonality is :synth_colony" do
      assert(Worker.civilisation_type(-6, :commonality) == :synth_colony)
    end
    test "when given -5/2, :commonality is :corporacy_world" do
      assert(Worker.civilisation_type(-5, :commonality) == :corporacy_world)
      assert(Worker.civilisation_type(2,  :commonality) == :corporacy_world)
    end
    test "when given -4, :commonality is :depot" do
      assert(Worker.civilisation_type(-4, :commonality) == :depot)
    end
    test "when given -3, :commonality is :seed_colony" do
      assert(Worker.civilisation_type(-3, :commonality) == :seed_colony)
    end
    test "when given -2, :commonality is :industrial_world" do
      assert(Worker.civilisation_type(-2, :commonality) == :industrial_world)
    end
    test "when given -1/0/1, :commonality is :commonality_civilisation" do
      assert(Worker.civilisation_type(-1, :commonality) == :commonality_civilisation)
      assert(Worker.civilisation_type(0,  :commonality) == :commonality_civilisation)
      assert(Worker.civilisation_type(1,  :commonality) == :commonality_civilisation)
    end
    test "when given 3, :commonality is :agri_world" do
      assert(Worker.civilisation_type(3, :commonality) == :agri_world)
    end
    test "when given 4, :commonality is :quarantined_world" do
      assert(Worker.civilisation_type(4, :commonality) == :quarantined_world)
    end
    test "when given 6/7, :commonality is :high_population_world" do
      assert(Worker.civilisation_type(6, :commonality) == :high_population_world)
      assert(Worker.civilisation_type(7, :commonality) == :high_population_world)
    end
    test "when given 8, :commonality is :commonality_hub" do
      assert(Worker.civilisation_type(8, :commonality) == :commonality_hub)
    end

    test "when given -8, :core is :prison_closed_world" do
      assert(Worker.civilisation_type(-8, :core) == :"prison/closed_world")
    end
    test "when given -7, :core is :instrumentality_hub" do
      assert(Worker.civilisation_type(-7, :core) == :instrumentality_hub)
    end
    test "when given -6/-5, :core is :high_population_world" do
      assert(Worker.civilisation_type(-6, :core) == :high_population_world)
      assert(Worker.civilisation_type(-5, :core) == :high_population_world)
    end
    test "when given -4, :core is :depot" do
      assert(Worker.civilisation_type(-4, :core) == :depot)
    end
    test "when given -3/-2, :core is :industrial_world" do
      assert(Worker.civilisation_type(-3, :core) == :industrial_world)
      assert(Worker.civilisation_type(-2, :core) == :industrial_world)
    end
    test "when given -1/0/1, :core is :core_world" do
      assert(Worker.civilisation_type(-1, :core) == :core_world)
      assert(Worker.civilisation_type(0,  :core) == :core_world)
      assert(Worker.civilisation_type(1,  :core) == :core_world)
      assert(Worker.civilisation_type(-2, :core) == :industrial_world)
    end
    test "when given -2/3, :core is :core_world" do
      assert(Worker.civilisation_type(2, :core) == :agri_world)
      assert(Worker.civilisation_type(3, :core) == :agri_world)
    end
    test "when given 4, :core is :quarantined_world" do
      assert(Worker.civilisation_type(4, :core) == :quarantined_world)
    end
    test "when given 5/6/7, :core is :high_population_world" do
      assert(Worker.civilisation_type(5, :core) == :high_population_world)
      assert(Worker.civilisation_type(6, :core) == :high_population_world)
      assert(Worker.civilisation_type(7, :core) == :high_population_world)
    end
    test "when given 8, :core is :core_worlds_hub" do
      assert(Worker.civilisation_type(8, :core) == :core_worlds_hub)
    end
  end
end
