defmodule MaiquiRoutine.Repo.Migrations.CreateCategoriesColourPaletteIdColumn do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      add :colour_palette_id, references(:colour_palettes, on_delete: :nothing, type: :binary_id), null: false
    end
  end
end
