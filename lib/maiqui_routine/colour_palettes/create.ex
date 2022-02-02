defmodule MaiquiRoutine.ColourPalettes.Create do
  alias MaiquiRoutine.{ColourPalette, Repo}

  @doc """
  ### Examples

      iex> params = %{name: "blue", dark_colour: "2F9CF3", light_colour: "BBDEFB", title_colour: "456170"}

      iex> MaiquiRoutine.ColourPalettes.Create.call params
      {:ok, %MaiquiRoutine.ColourPalette{}}
      
  """
  @spec call(ColourPalette.params()) :: {:ok, Schema.t()} | {:error, Changeset.t()}
  def call(params) when is_map(params) do
    %ColourPalette{}
    |> ColourPalette.changeset(params)
    |> Repo.insert()
  end
end
