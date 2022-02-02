defmodule MaiquiRoutine.Repo.Migrations.CreateColourPalettes do
  use Ecto.Migration

  def change do
    create table(:colour_palettes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :dark_colour, :string
      add :light_colour, :string
      add :title_colour, :string

      timestamps()
    end
  end
end
