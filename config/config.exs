# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mpi,
  namespace: MPI,
  ecto_repos: [MPI.Repo],
  max_persons_result: {:system, :integer, "MAX_PERSONS_RESULT", 15}

# Configures the endpoint
config :mpi, MPI.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bvzeKHzH8k+qavTDh5NTxFcnPVHIL+Ybi1Bucq2TrJ3I3zqbXEqFr37QbrL0c202",
  render_errors: [view: EView.Views.PhoenixError, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure JSON Logger back-end
config :logger_json, :backend,
  on_init: {MPI, :load_from_system_env, []},
  json_encoder: Poison,
  metadata: :all

config :mpi, MPI.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mpi_dev",
  hostname: "localhost",
  pool_size: 10

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
