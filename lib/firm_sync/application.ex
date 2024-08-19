defmodule FirmSync.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FirmSyncWeb.Telemetry,
      # Start the Ecto repository
      FirmSync.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FirmSync.PubSub},
      # Start Finch
      {Finch, name: FirmSync.Finch},
      # Start the Endpoint (http/https)
      FirmSyncWeb.Endpoint
      # Start a worker by calling: FirmSync.Worker.start_link(arg)
      # {FirmSync.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FirmSync.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FirmSyncWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
