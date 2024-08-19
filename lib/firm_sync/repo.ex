defmodule FirmSync.Repo do
  use Ecto.Repo,
    otp_app: :firm_sync,
    adapter: Ecto.Adapters.Postgres
end
