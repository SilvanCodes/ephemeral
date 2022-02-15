import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ephemeral, EphemeralWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ssa3BAwSwcXW4BMgo/rUSZJfTdEobX+7J7CU9I7+U9u+si2vTN1Y0RevRiA3oPHq",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
