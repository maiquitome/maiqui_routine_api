defmodule MaiquiRoutine.Repo do
  use Ecto.Repo,
    otp_app: :maiqui_routine,
    adapter: Ecto.Adapters.Postgres
end
