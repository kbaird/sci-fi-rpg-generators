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

  defp do_world_type(:hostile, roll) when roll < 7,  do: %{size: :standard}
  defp do_world_type(:hostile, roll) when roll < 10, do: %{size: :tiny}
  defp do_world_type(:hostile, roll) when roll < 13, do: %{size: :standard}
  defp do_world_type(:hostile, _roll), do: %{size: :large}

  defp do_world_type(:barren, roll) when roll < 7,  do: %{size: :small}
  defp do_world_type(:barren, roll) when roll < 11, do: %{size: :tiny}
  defp do_world_type(:barren, roll) when roll < 13, do: %{size: :asteroid_belt}
  defp do_world_type(:barren, roll) when roll < 17, do: %{size: :standard}
  defp do_world_type(:barren, _roll), do: %{size: :large}

  defp do_world_type(:garden, roll) when roll < 17, do: %{size: :standard}
  defp do_world_type(:garden, _roll), do: %{size: :large}
end
