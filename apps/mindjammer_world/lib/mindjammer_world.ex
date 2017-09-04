defmodule MindjammerWorld do
  @moduledoc """
  Documentation for MindjammerWorld.
  """

  alias MindjammerWorld.Worker

  @inhabited_types ~w(lost_colony rediscovered commonality core)a

  def make(inhabitation_type) when inhabitation_type in @inhabited_types do
    Worker.make_world(:inhabited, inhabitation_type)
  end
end
