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

  defp do_civilisation_type(roll, :lost_colony)  when roll < -6, do: :failing
  defp do_civilisation_type(roll, :rediscovered) when roll < -7, do: :failing
  defp do_civilisation_type(roll, :commonality)  when roll < -7, do: :failing
  defp do_civilisation_type(roll, :core)         when roll < -7, do: :"prison/closed_world"

  defp do_planetary_type(-4), do: {:non_garden_world, -4}
  defp do_planetary_type(roll) when roll < -1, do: {:marginal_garden_world, -2}
  defp do_planetary_type(roll) when roll < 2,  do: {:inferior_garden_world, 0}
  defp do_planetary_type(roll) when roll < 4,  do: {:standard_garden_world, 2}
  defp do_planetary_type(4),  do: {:superior_garden_world, 4}
end
