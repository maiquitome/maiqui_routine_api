defmodule MaiquiRoutine.Users.Create do
  alias MaiquiRoutine.{User, Repo}

  @spec call(User.t()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def call(%{} = params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
