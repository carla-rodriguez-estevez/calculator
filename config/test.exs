import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :counter, CounterWeb.Endpoint,
  http: [ port: 4001],
  secret_key_base: "q4XVgrJVwoR0pNbJrQAiJLdCrAkQxd4gM3adKS0iQt611aQr7HTB8MwEA3eav9QD",
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
