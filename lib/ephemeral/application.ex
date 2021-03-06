defmodule Ephemeral.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      # Start the Telemetry supervisor
      EphemeralWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ephemeral.PubSub},
      # Start the Presence system
      EphemeralWeb.Presence,
      # Start the Endpoint (http/https)
      EphemeralWeb.Endpoint,
      # Start a worker by calling: Ephemeral.Worker.start_link(arg)
      # {Ephemeral.Worker, arg}
      {Cluster.Supervisor, [topologies, [name: Ephemeral.ClusterSupervisor]]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ephemeral.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EphemeralWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
