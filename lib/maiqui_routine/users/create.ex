defmodule MaiquiRoutine.Users.Create do
  alias MaiquiRoutine.{User, Repo}
  alias Ecto.{Schema, Changeset}

  @doc """
  ### Examples

      iex> user = %{name: "Maiqui", email: "maiqui@email.com", password: "12345678"}

      iex> MaiquiRoutine.Users.Create.call user
      {:ok, %MaiquiRoutine.User{}}

  """
  @spec call(User.params()) :: {:ok, Schema.t()} | {:error, Changeset.t()}
  def call(params) when is_map(params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
