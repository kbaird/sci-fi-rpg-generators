defmodule MindjammerWorld.Worker do
  @moduledoc false
  use GenServer

  # API

  def df(dice_count) do
    Enum.reduce((0..dice_count), 0, fn(_, acc) -> :rand.uniform(3) - 2 + acc end)
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def civilisation_type(roll, inhabitation_type) do
    GenServer.call(__MODULE__, {:civilisation_type, roll, inhabitation_type})
  end

  def planetary_type(roll) do
    GenServer.call(__MODULE__, {:planetary_type, roll})
  end

  # SERVER

  def init(:ok), do: {:ok, %{}}

  def handle_call({:civilisation_type, roll, inhabitation_type}, _from, state) do
    {:reply, do_civilisation_type(roll, inhabitation_type), state}
  end

  def handle_call({:planetary_type, roll}, _from, state) do
    {:reply, do_planetary_type(roll), state}
  end

  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### PRIVATE FUNCTIONS

  defp do_civilisation_type(roll, :lost_colony)  when roll < -6,         do: :failing
  defp do_civilisation_type(roll, :lost_colony)  when roll in [-6,-5,2], do: :regressed
  defp do_civilisation_type(-4,   :lost_colony), do: :alien_civilisation
  defp do_civilisation_type(-3,   :lost_colony), do: :holdout
  defp do_civilisation_type(-2,   :lost_colony), do: :industrial_world
  defp do_civilisation_type(roll, :lost_colony)  when roll in (-1..1),   do: :balkanised
  defp do_civilisation_type(3,    :lost_colony), do: :agri_world
  defp do_civilisation_type(4,    :lost_colony), do: :united_world
  defp do_civilisation_type(5,    :lost_colony), do: :failing
  defp do_civilisation_type(6,    :lost_colony), do: :high_population_world
  defp do_civilisation_type(7,    :lost_colony), do: :interstellar_civilisation
  defp do_civilisation_type(8,    :lost_colony), do: :interstellar_hub

  defp do_civilisation_type(roll, :rediscovered) when roll < -7, do: :failing
  defp do_civilisation_type(roll, :rediscovered) when roll < -4, do: :regressed
  defp do_civilisation_type(roll, :rediscovered) when roll < -2, do: :holdout
  defp do_civilisation_type(-2,   :rediscovered), do: :industrial_world
  defp do_civilisation_type(roll, :rediscovered) when roll in [-1,1], do: :balkanised
  defp do_civilisation_type(0,    :rediscovered), do: :united_world
  defp do_civilisation_type(2,    :rediscovered), do: :regressed
  defp do_civilisation_type(3,    :rediscovered), do: :agri_world
  defp do_civilisation_type(4,    :rediscovered), do: :culture_world
  defp do_civilisation_type(5,    :rediscovered), do: :culture_world
  defp do_civilisation_type(6,    :rediscovered), do: :high_population_world
  defp do_civilisation_type(7,    :rediscovered), do: :interstellar_civilisation
  defp do_civilisation_type(8,    :rediscovered), do: :interstellar_hub

  defp do_civilisation_type(roll, :commonality)  when roll < -7, do: :failing

  defp do_civilisation_type(roll, :core)         when roll < -7, do: :"prison/closed_world"

  defp do_planetary_type(-4), do: {:non_garden_world, -4}
  defp do_planetary_type(roll) when roll < -1, do: {:marginal_garden_world, -2}
  defp do_planetary_type(roll) when roll < 2,  do: {:inferior_garden_world, 0}
  defp do_planetary_type(roll) when roll < 4,  do: {:standard_garden_world, 2}
  defp do_planetary_type(4),  do: {:superior_garden_world, 4}
end
