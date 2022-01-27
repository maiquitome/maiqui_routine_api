defmodule MaiquiRoutine.Repo.Migrations.CreateCategoriesUserIdNameUniqueIndex do
  use Ecto.Migration

  def change do
    create unique_index(:categories, [:user_id, :name])
  end
end
