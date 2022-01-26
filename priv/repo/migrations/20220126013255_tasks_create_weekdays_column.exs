defmodule MaiquiRoutine.Repo.Migrations.TasksCreateWeekdaysColumn do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :weekdays, {:array, :weekday}
    end
  end
end
