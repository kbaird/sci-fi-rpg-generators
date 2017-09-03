defmodule GurpsWorld.Worker do
  @moduledoc false
  use GenServer

  # API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def overall_type(roll) do
    GenServer.call(__MODULE__, {:overall_type, roll})
  end

  def world_type(overall_type, roll) do
    GenServer.call(__MODULE__, {:world_type, overall_type, roll})
  end

  # SERVER

  def init(:ok), do: {:ok, %{}}

  def handle_call({:overall_type, roll}, _from, state) do
    {:reply, do_overall_type(roll), state}
  end

  def handle_call({:world_type, overall_type, roll}, _from, state) do
    {:reply, do_world_type(overall_type, roll), state}
  end

  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### PRIVATE FUNCTIONS

  defp do_overall_type(roll) when roll < 8,  do: :hostile
  defp do_overall_type(roll) when roll < 14, do: :barren
  defp do_overall_type(_roll),               do: :garden

  defp do_world_type(overall_type, roll) do
    %{size:     world_size(overall_type, roll),
      sub_type: world_subtype(overall_type, roll)}
  end

  defp world_size(:hostile, roll) when roll < 7,  do: :standard
  defp world_size(:hostile, roll) when roll < 10, do: :tiny
  defp world_size(:hostile, roll) when roll < 13, do: :standard
  defp world_size(:hostile, _roll), do: :large

  defp world_size(:barren, roll) when roll < 7,  do: :small
  defp world_size(:barren, roll) when roll < 11, do: :tiny
  defp world_size(:barren, roll) when roll < 13, do: :asteroid_belt
  defp world_size(:barren, roll) when roll < 17, do: :standard
  defp world_size(:barren, _roll), do: :large

  defp world_size(:garden, roll) when roll < 17, do: :standard
  defp world_size(:garden, _roll), do: :large

  defp world_subtype(:hostile, roll) when roll in [3,4,17,18], do: :cthonian
  defp world_subtype(:hostile, roll) when roll in [5,6,15,16], do: :greenhouse
  defp world_subtype(:hostile, roll) when roll < 10, do: :sulfur
  defp world_subtype(:hostile, roll) when roll < 15, do: :ammonia

  defp world_subtype(:barren, roll) when roll in [3,16], do: :hadean
  defp world_subtype(:barren, roll) when roll in [4,9,10,15,18], do: :ice
  defp world_subtype(:barren, roll) when roll < 9,  do: :rock
  defp world_subtype(:barren, roll) when roll < 13, do: :belt
  defp world_subtype(:barren, roll) when roll in [13,14,17], do: :ocean

  defp world_subtype(:garden, _roll), do: :garden
end
