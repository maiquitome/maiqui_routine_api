defmodule MaiquiRoutine.Repo.Migrations.CreateWeekdayType do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE weekday AS ENUM ('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat')"

    down_query = "DROP TYPE weekday"

    execute(up_query, down_query)
  end
end
