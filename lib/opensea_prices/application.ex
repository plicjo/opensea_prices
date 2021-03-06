defmodule OpenseaPrices.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      OpenseaPrices.Repo,
      # Start the Telemetry supervisor
      OpenseaPricesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: OpenseaPrices.PubSub},
      # Start the Endpoint (http/https)
      OpenseaPricesWeb.Endpoint,
      {OpenseaPrices.Worker, []},
      # Start a worker by calling: OpenseaPrices.Worker.start_link(arg)
      # {OpenseaPrices.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OpenseaPrices.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OpenseaPricesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
