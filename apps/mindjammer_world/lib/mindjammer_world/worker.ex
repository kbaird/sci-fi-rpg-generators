defmodule MindjammerWorld.Worker do
  @moduledoc false
  use GenServer

  alias MindjammerWorld.{InhabitedTypeWorker,
                         UnknownTypeWorker}

  # API

  def df(dice_count) do
    Enum.reduce((0..dice_count), 0, fn(_, acc) -> :rand.uniform(3) - 2 + acc end)
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def make_world(awareness_level, inhabitation_type) do
    GenServer.call(__MODULE__, {:make_world, awareness_level, inhabitation_type})
  end

  def civilisation_type(roll, inhabitation_type) do
    GenServer.call(InhabitedTypeWorker, {:civilisation_type, roll, inhabitation_type})
  end

  def planetary_type(roll, :inhabited) do
    GenServer.call(InhabitedTypeWorker, {:planetary_type, roll})
  end
  def planetary_type(roll, :inner_system) do
    GenServer.call(UnknownTypeWorker, {:inner_planetary_type, roll})
  end
  def planetary_type(roll, :h_zone) do
    GenServer.call(UnknownTypeWorker, {:h_zone_planetary_type, roll})
  end
  def planetary_type(roll, :outer_system) do
    GenServer.call(UnknownTypeWorker, {:outer_planetary_type, roll})
  end

  # SERVER

  def init(:ok), do: {:ok, %{}}

  def handle_call({:make_world, :inhabited, inhabitation_type}, _from, state) do
    {type_label, civ_mod} = roll() |> planetary_type(:inhabited)
    civ_type = civilisation_type(roll() + civ_mod, inhabitation_type)
    response = %{
      civilisation_type: civ_type,
      high_concept:      high_concept([type_label, inhabitation_type, civ_type]),
      planetary_type:    type_label,
    }
    {:reply, response, state}
  end
  def handle_call({:make_world, :unknown, unknown_type}, from, state) do
    handle_call({:make_world, :unknown, unknown_type, age: roll()}, from, state)
  end
  def handle_call({:make_world, :unknown, unknown_type, age: age}, _from, state) do
    type_label = (roll() + age) |> planetary_type(unknown_type)
    response = %{
      high_concept:   high_concept([type_label]),
      planetary_type: type_label,
    }
    {:reply, response, state}
  end


  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### PRIVATE FUNCTIONS

  defp high_concept(args) do
    args
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
