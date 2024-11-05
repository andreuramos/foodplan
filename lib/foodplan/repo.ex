defmodule Foodplan.Repo do
  use Ecto.Repo,
    otp_app: :foodplan,
    adapter: Ecto.Adapters.Postgres
end
