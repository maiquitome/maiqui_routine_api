defmodule MaiquiRoutine.Categories.GetByName do
  alias MaiquiRoutine.{Category, Repo}
  alias Ecto.Schema

  @doc """
  ### Examples

    iex> {:ok, %MaiquiRoutine.User{id: user_id}} = MaiquiRoutine.Users.get_by_email "maiqui@email.com"

    iex> MaiquiRoutine.Categories.GetByName.call "study", user_id
    {:ok, %MaiquiRoutine.Category{}}

    iex> MaiquiRoutine.Categories.GetByName.call "stud", user_id
    {:error, "Category not found"}

  """
  @spec call(binary(), binary()) :: {:ok, Schema.t()} | {:error, String.t()}
  def call(category_name, user_id) do
    case Repo.get_by(Category, name: category_name, user_id: user_id) do
      nil -> {:error, "Category not found"}
      category -> {:ok, category}
    end
  end
end
