defmodule MaiquiRoutine.Repo.Migrations.RemoveCategoriesColourColumns do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      remove :dark_color
      remove :light_color
      remove :title_color
    end
  end
end
