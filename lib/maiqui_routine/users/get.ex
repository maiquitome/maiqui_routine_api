defmodule MaiquiRoutine.Users.Get do
  alias MaiquiRoutine.{User, Repo}
  alias Ecto.Schema

  @doc """
  ## Examples

      iex> MaiquiRoutine.Users.Get.by_id "9871115f-9b15-403e-9897-7d338117da49"
      {:ok, %MaiquiRoutine.User{}}

  """
  @spec by_id(binary()) :: {:ok, Schema.t()} | {:error, String.t()}
  def by_id(id) when is_binary(id) do
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
