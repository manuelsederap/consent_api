# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :consent_api,
  namespace: Consent,
  ecto_repos: [Consent.Repo]

# Configures the endpoint
config :consent_api, ConsentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hTMzFCVZYGNjcNHCxAa04EPzZq1x6KTCQFQS64vsNQlNAGeRsVlM3nGMQAeyQO8j",
  render_errors: [view: ConsentWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: [name: Consent.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "wPkRY712"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
