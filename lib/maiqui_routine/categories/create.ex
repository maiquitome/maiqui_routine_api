defmodule MaiquiRoutine.Categories.Create do
  alias MaiquiRoutine.{Category, Repo}
  alias Ecto.{Schema, Changeset}

  @doc """
  ### Examples

      iex> {:ok, user} = MaiquiRoutine.Users.Get.by_email "maiqui@email.com"

      iex> category = %{user_id: user.id, name: "study", dark_color: "2F9CF3", light_color: "BBDEFB", title_color: "456170"}

      iex> MaiquiRoutine.Categories.Create.call category
      {:ok, %MaiquiRoutine.Category{}}

  """
  @spec call(Category.params()) :: {:ok, Schema.t()} | {:error, Changeset.t()}
  def call(params) when is_map(params) do
    %Category{}
    |> Category.changeset(params)
    |> Repo.insert();
  end
end
