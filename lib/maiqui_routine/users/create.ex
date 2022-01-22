defmodule MaiquiRoutine.Users.Create do
  alias MaiquiRoutine.{User, Repo}

  @type user_params :: %{
          name: String.t(),
          email: String.t(),
          password: String.t()
        }

  @doc """
  Inserts a user in the database.

  ## Examples

      iex> user = %{name: "Maiqui", email: "maiqui@gmail.com", password: "12345678"}

      iex> MaiquiRoutine.Users.Create.call(user)
      {:ok, %MaiquiRoutine.User{}}

  """
  @spec call(user_params()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def call(%{} = params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
