defmodule MaiquiRoutine.Tasks.GetById do
  alias MaiquiRoutine.{Repo, Task}

  @doc """
  ### Examples

      iex> MaiquiRoutine.Tasks.GetById.call "0eaface8-a322-421f-a784-57933e57d5ad"
      {:ok, %MaiquiRoutine.Task{}}

      iex> MaiquiRoutine.Tasks.GetById.call "0eaface8-a322-421f-a784-57933e57d5a1"
      {:error, "Task not found"}

  """
  @spec call(binary()) :: {:error, String.t()} | {:ok, Ecto.Schema.t()}
  def call(id) when is_binary(id) do
    case Repo.get_by(Task, id: id) do
      nil -> {:error, "Task not found"}
      task -> {:ok, task}
    end
  end

  def call(_) do
    {:error, "id must be of type binary"}
  end
end
