defmodule MaiquiRoutine.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :start_time, :time
      add :end_time, :time
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)
      add :category_id, references(:categories, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:tasks, [:user_id])
    create index(:tasks, [:category_id])
  end
end
