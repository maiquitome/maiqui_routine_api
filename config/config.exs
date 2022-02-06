# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :maiqui_routine,
  ecto_repos: [MaiquiRoutine.Repo],
  generators: [binary_id: true]

# Auth
config :maiqui_routine, MaiquiRoutineWeb.Auth.Guardian,
  issuer: "maiqui_routine",
  secret_key:
    System.get_env("SECRET_KEY_GUARDIAN") ||
      raise("""
      environment variable SECRET_KEY_GUARDIAN is missing.
      """)

# Configures the endpoint
config :maiqui_routine, MaiquiRoutineWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: MaiquiRoutineWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MaiquiRoutine.PubSub,
  live_view: [signing_salt: "1qXOO2Nf"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :maiqui_routine, MaiquiRoutine.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
