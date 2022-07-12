defmodule KrumpnServer.Repo do
  use Ecto.Repo,
    otp_app: :krumpn_server,
    adapter: Ecto.Adapters.Postgres
end
