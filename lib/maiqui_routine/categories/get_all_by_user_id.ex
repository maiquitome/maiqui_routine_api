defmodule MaiquiRoutine.Categories.GetAllByUserId do
  import Ecto.Query

  alias MaiquiRoutine.{Category, Repo, User, Users}
  alias Ecto.Schema

  @doc """
  ### Examples

      iex> alias MaiquiRoutine.{User, Users, Category, Categories}

      iex> {:ok, %User{id: user_id}} = Users.get_by_email "maiqui@email.com"

      iex> Categories.GetAllByUserId.call user_id
      {:ok, [%Category{}]}

      iex> Categories.GetAllByUserId.call "ad42bac1-5cae-4c7c-8b40-8f056d5163a1"
      {:error, "User not found"}

  """
  @spec call(binary()) :: {:ok, [Schema.t()]}
  def call(user_id) do
    query = from(Category, where: [user_id: ^user_id])

    with {:ok, %User{}} <- Users.get_by_id(user_id),
         categories <- Repo.all(query) do
      {:ok, categories}
    end
  end
end
