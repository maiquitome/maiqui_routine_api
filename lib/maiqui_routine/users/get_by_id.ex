defmodule MaiquiRoutine.Users.GetById do
  alias MaiquiRoutine.{User, Repo}

  @doc """
  ### Examples

      iex> MaiquiRoutine.Users.GetById.call "9871115f-9b15-403e-9897-7d338117da49"
      {:ok, %MaiquiRoutine.User{}}

      iex> MaiquiRoutine.Users.GetById.call "9871115f-9b15-403e-9897-7d338117da48"
      {:error, "User not found"}

      iex> MaiquiRoutine.Users.GetById.call "9871115f-9b15-403e-9897-7"
      {:error, "Invalid UUID"}

  """
  @spec call(binary()) :: {:ok, Schema.t()} | {:error, String.t()}
  def call(id) when is_binary(id) do
    id
    |> Ecto.UUID.cast()
    |> handle_cast()
  end

  def call(_) do
    {:error, "id must be of type binary"}
  end

  defp handle_cast({:ok, id}) when is_binary(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp handle_cast(:error), do: {:error, "Invalid UUID"}
end
