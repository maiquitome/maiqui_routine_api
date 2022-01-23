defmodule MaiquiRoutine.Users.Create do
  alias MaiquiRoutine.{User, Repo}

  @spec call(User.params()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def call(params) when is_map(params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
