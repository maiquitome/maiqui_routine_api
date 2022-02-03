defmodule MaiquiRoutine.Repo.Migrations.CreateTodos do
  use Ecto.Migration


  def change do
    create table(:todos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, :string
      add :checked, :boolean, default: false, null: false
      add :task_id, references(:tasks, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:todos, [:task_id])
  end
end
