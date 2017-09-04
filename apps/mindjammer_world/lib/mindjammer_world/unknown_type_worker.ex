defmodule MindjammerWorld.UnknownTypeWorker do
  @moduledoc false
  use GenServer

  # API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  # SERVER

  def init(:ok), do: {:ok, %{}}

  def handle_call({:inner_planetary_type, roll}, _from, state) do
    {:reply, inner_planetary_type(roll), state}
  end
  def handle_call({:h_zone_planetary_type, roll}, _from, state) do
    {:reply, h_zone_planetary_type(roll), state}
  end
  def handle_call({:outer_planetary_type, roll}, _from, state) do
    {:reply, outer_planetary_type(roll), state}
  end

  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### PRIVATE FUNCTIONS

  defp inner_planetary_type(roll) when roll < -6, do: :accretion_disk
  defp inner_planetary_type(roll) when roll < -4, do: :proto_planet
  defp inner_planetary_type(roll) when roll in [-4,6], do: :gas_giant
  defp inner_planetary_type(roll) when roll in [-3,1], do: :inferno
  defp inner_planetary_type(roll) when roll in [-2,0,2,5], do: :terrestrial
  defp inner_planetary_type(roll) when roll in [-1,4], do: :desert_world
  defp inner_planetary_type(roll) when roll in [3], do: :marginal_garden_world
  defp inner_planetary_type(7), do: :cthonian
  defp inner_planetary_type(8), do: :carbon_planet

  defp h_zone_planetary_type(roll) when roll < -6, do: :accretion_disk
  defp h_zone_planetary_type(roll) when roll < -4, do: :proto_planet
  defp h_zone_planetary_type(roll) when roll in [-4,6], do: :desert_world
  defp h_zone_planetary_type(roll) when roll in [-3], do: :ocean_world
  defp h_zone_planetary_type(roll) when roll in [-2,0,2], do: :terrestrial
  defp h_zone_planetary_type(roll) when roll in [-1,7], do: :marginal_garden_world
  defp h_zone_planetary_type(1), do: :standard_garden_world
  defp h_zone_planetary_type(3), do: :superior_garden_world
  defp h_zone_planetary_type(4), do: :super_earth
  defp h_zone_planetary_type(5), do: :gas_giant
  defp h_zone_planetary_type(6), do: :inferior_garden_world
  defp h_zone_planetary_type(8), do: :"post-garden_world"

  defp outer_planetary_type(roll) when roll < -6, do: :accretion_disk
  defp outer_planetary_type(roll) when roll < -4, do: :proto_gas_giant
  defp outer_planetary_type(roll) when roll in [-4], do: :iceball
  defp outer_planetary_type(roll) when roll in [-3,0,1], do: :gas_giant
  defp outer_planetary_type(roll) when roll in [-2,2], do: :ice_giant
  defp outer_planetary_type(roll) when roll in [-1], do: :dwarf_planet
  defp outer_planetary_type(3), do: :asteroid_belt
  defp outer_planetary_type(4), do: :marginal_garden_moon_of_gas_giant
  defp outer_planetary_type(5), do: :rogue_planet
  defp outer_planetary_type(6), do: :helium_planet
  defp outer_planetary_type(roll) when roll in [7,8], do: :carbon_planet
end
