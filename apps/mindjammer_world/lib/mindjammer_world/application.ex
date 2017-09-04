defmodule MindjammerWorld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  @worker_names [MindjammerWorld.Worker,
                 MindjammerWorld.InhabitedTypeWorker,
                 MindjammerWorld.UnknownTypeWorker]

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children =
      # Starts a worker by calling: MindjammerWorld.Worker.start_link(arg)
      @worker_names |> Enum.map(&tuplify_worker_name/1)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MindjammerWorld.Supervisor]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end

  ### PRIVATE FUNCTIONS

  defp tuplify_worker_name(name), do: {name, name: name}
end
