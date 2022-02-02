defmodule MaiquiRoutine.Repo.Migrations.CreateColourPalletesNameUniqueIndex do
  use Ecto.Migration

  def change do
    create unique_index(:colour_palettes, [:name])
  end
end
