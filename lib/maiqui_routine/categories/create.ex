defmodule MaiquiRoutine.Categories.Create do
  alias MaiquiRoutine.{Category, Repo}
  alias Ecto.{Schema, Changeset}

  @doc """
  ### Examples

      iex> alias MaiquiRoutine.{
        Category,
        Categories,
        ColourPalette,
        ColourPalettes,
        User,
        Users
      }

      iex> {:ok, %User{id: user_id}} = Users.Get.by_email "maiqui@email.com"

      iex> {:ok, %ColourPalette{id: colour_palette_id}} = ColourPalettes.get_by_name "blue"

      iex> category_params = %{user_id: user_id, name: "study", colour_palette_id: colour_palette_id}

      iex> Categories.Create.call category_params
      {:ok, %Category{}}

  """
  @spec call(Category.params()) :: {:ok, Schema.t()} | {:error, Changeset.t()}
  def call(params) when is_map(params) do
    %Category{}
    |> Category.changeset(params)
    |> Repo.insert()
  end
end
