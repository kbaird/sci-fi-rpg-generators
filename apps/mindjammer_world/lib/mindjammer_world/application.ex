defmodule MindjammerWorld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: MindjammerWorld.Worker.start_link(arg)
      {MindjammerWorld.TypeWorker, name: MindjammerWorld.TypeWorker},
      {MindjammerWorld.Worker,     name: MindjammerWorld.Worker},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MindjammerWorld.Supervisor]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end
end
