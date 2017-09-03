defmodule GurpsWorld.Worker do
  @moduledoc false
  use GenServer

  # API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def world_type(roll) do
    GenServer.call(__MODULE__, {:world_type, roll})
  end

  # SERVER

  def init(:ok), do: {:ok, %{}}

  def handle_call({:world_type, roll}, _from, state) do
    {:reply, do_world_type(roll), state}
  end

  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### PRIVATE FUNCTIONS

  defp do_world_type(roll) when roll < 8,  do: :hostile
  defp do_world_type(roll) when roll < 14, do: :barren
  defp do_world_type(roll),                do: :garden
end
