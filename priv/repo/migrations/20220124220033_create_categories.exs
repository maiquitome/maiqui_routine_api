defmodule MaiquiRoutine.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :dark_color, :integer
      add :light_color, :integer
      add :title_color, :integer
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:categories, [:user_id])
  end
end
