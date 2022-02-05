defmodule MaiquiRoutine.Tasks.GetAllByWeekday do
  import Ecto.Query

  alias MaiquiRoutine.{Repo, Task, User, Users}
  alias Ecto.Schema

  @doc """
  ### Examples

      iex> alias MaiquiRoutine.Tasks.GetAllByWeekday

      iex> GetAllByWeekday.call(:mon, "fd6688fe-c1f9-4d43-9f9a-6b01dc1b57b3")
      {:ok, [%MaiquiRoutine.Task{}]}

      iex> GetAllByWeekday.call(:tue, "fd6688fe-c1f9-4d43-9f9a-6b01dc1b57b3")
      {:error, "Tasks not found"}

      iex> GetAllByWeekday.call(:mon, "fd6688fe-c1f9-4d43-9f9a-6b01dc1b57b4")
      {:error, "User not found"}

  """
  @spec call(atom(), binary()) :: {:error, String.t()} | {:ok, [Schema.t()]}
  def call(weekday, user_id)
      when is_atom(weekday)
      when is_binary(user_id) do
    with {:ok, %User{}} <- Users.get_by_id(user_id) do
      query =
        from(t in Task,
          where: ^weekday in t.weekdays and ^user_id == t.user_id
        )

      case Repo.all(query) do
        [] -> {:error, "Tasks not found"}
        tasks -> {:ok, tasks}
      end
    end
  end
end
