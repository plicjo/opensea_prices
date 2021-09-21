# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :opensea_prices,
  ecto_repos: [OpenseaPrices.Repo]

# Configures the endpoint
config :opensea_prices, OpenseaPricesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Wh5g/OF08BISyU68PGhh9dxcX5053nvDvastHKEASkkISNbbL7iznyb33kyUW3JT",
  render_errors: [view: OpenseaPricesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OpenseaPrices.PubSub,
  live_view: [signing_salt: "MFKg+MtZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
