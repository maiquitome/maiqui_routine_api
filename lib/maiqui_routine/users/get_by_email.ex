defmodule MaiquiRoutine.Users.GetByEmail do
  alias MaiquiRoutine.{User, Repo}
  alias Ecto.Schema

  @doc """
  ## Examples

      iex> MaiquiRoutine.Users.GetByEmail.call "maiqui@email.com"
      {:ok, %MaiquiRoutine.User{}}

      iex> MaiquiRoutine.Users.GetByEmail.call "maiqui@email"
      {:error, "User not found. Please check email."}

  """
  @spec call(binary()) :: {:ok, Schema.t()} | {:error, String.t()}
  def call(email) when is_binary(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "User not found. Please check email."}
      user_schema -> {:ok, user_schema}
    end
  end

  def call(_) do
    {:error, "Email must be of type binary."}
  end
end
