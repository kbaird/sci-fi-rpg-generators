defmodule MindjammerWorld do
  @moduledoc """
  Documentation for MindjammerWorld.
  """

  alias MindjammerWorld.Worker

  def make(inhabitation_type) do
    Worker.make_world(inhabitation_type)
  end
end
