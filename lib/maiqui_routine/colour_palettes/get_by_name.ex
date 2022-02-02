defmodule MaiquiRoutine.ColourPalettes.GetByName do
  alias MaiquiRoutine.{ColourPalette, Repo}
  alias Ecto.Schema

  @doc """
  ### Examples

    iex> MaiquiRoutine.ColourPalettes.GetByName.call "blue"
    {:ok, %MaiquiRoutine.ColourPalette{}}

    iex> MaiquiRoutine.ColourPalettes.GetByName.call "blu"
    {:error, "Colour Palette not found"}

  """
  @spec call(binary()) :: {:ok, Schema.t()} | {:error, String.t()}
  def call(name) do
    case Repo.get_by(ColourPalette, name: name) do
      nil -> {:error, "Colour Palette not found"}
      colour_palette -> {:ok, colour_palette}
    end
  end
end
