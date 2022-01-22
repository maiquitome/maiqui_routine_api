defmodule MaiquiRoutine.Users.Create do
  alias MaiquiRoutine.{User, Repo}

  @doc """
  Inserts a user in the database.

  ## Examples

      iex> user = %{name: "Maiqui", email: "maiqui@gmail.com", password: "12345678"}

      iex> MaiquiRoutine.Users.Create.call(user)
      {:ok, %MaiquiRoutine.User{}}

  """
  def call(%{} = params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
