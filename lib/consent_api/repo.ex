defmodule Consent.Repo do
  use Ecto.Repo,
    otp_app: :consent_api,
    adapter: Ecto.Adapters.Postgres
end
