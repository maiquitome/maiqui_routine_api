defmodule MaiquiRoutine.Users.Get do
  alias MaiquiRoutine.{User, Repo}

  @spec call(binary()) :: {:ok, Ecto.Schema.t()} | {:error, String.t()}
  def call(id) when is_binary(id) do
    id
    |> Ecto.UUID.cast()
    |> handle_cast()
  end

  defp handle_cast({:ok, id}) when is_binary(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp handle_cast(:error), do: {:error, "Invalid UUID"}
end
