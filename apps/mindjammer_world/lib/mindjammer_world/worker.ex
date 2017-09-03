defmodule MindjammerWorld.Worker do
  @moduledoc false
  use GenServer

  alias MindjammerWorld.TypeWorker

  # API

  def df(dice_count) do
    Enum.reduce((0..dice_count), 0, fn(_, acc) -> :rand.uniform(3) - 2 + acc end)
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def make_world(inhabitation_type) do
    GenServer.call(__MODULE__, {:make_world, inhabitation_type})
  end

  def civilisation_type(roll, inhabitation_type) do
    GenServer.call(TypeWorker, {:civilisation_type, roll, inhabitation_type})
  end

  def planetary_type(roll) do
    GenServer.call(TypeWorker, {:planetary_type, roll})
  end

  # SERVER

  def init(:ok), do: {:ok, %{}}

  def handle_call({:make_world, inhabitation_type}, _from, state) do
    {type_label, civ_mod} = roll() |> planetary_type()
    civ_type = civilisation_type(roll() + civ_mod, inhabitation_type)
    response = %{
      civilisation_type: civ_type,
      high_concept:      high_concept(type_label, civ_type),
      planetary_type:    type_label,
    }
    {:reply, response, state}
  end

  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### PRIVATE FUNCTIONS

  defp high_concept(type_label, civ_type) do
    [type_label, civ_type]
    |> Enum.map(fn(atom) -> snake_case_to_aspect("#{atom}") end)
    |> Enum.join(" ")
    |> String.replace("World ", "")
  end

  defp snake_case_to_aspect(str) do
    str
    |> String.split("_")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  defp roll, do: df(4)
end
