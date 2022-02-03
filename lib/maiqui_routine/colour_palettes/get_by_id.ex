defmodule MaiquiRoutine.ColourPalettes.GetById do
  alias MaiquiRoutine.{ColourPalette, Repo}
  alias Ecto.Schema

  @doc """
  ### Examples

    iex> MaiquiRoutine.ColourPalettes.GetById.call "31da1697-bb5a-4783-9be8-43e3be47beb2"
    {:ok, %MaiquiRoutine.ColourPalette{}}

    iex> MaiquiRoutine.ColourPalettes.GetById.call "31da1697-bb5a-4783-9be8-43e3be47beb3"
    {:error, "Colour Palette not found"}

  """
  @spec call(binary()) :: {:ok, Schema.t()} | {:error, String.t()}
  def call(id) do
    case Repo.get_by(ColourPalette, id: id) do
      nil -> {:error, "Colour Palette not found"}
      colour_palette -> {:ok, colour_palette}
    end
  end
end
