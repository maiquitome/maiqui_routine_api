defmodule MaiquiRoutine.Todos.Create do
  alias MaiquiRoutine.{Repo, Todo, Task, Tasks}
  alias Ecto.{Schema, Changeset}

  @doc """
  ### Examples

      iex> todo_params = %{description: "Learn 10 words in English", task_id: "0eaface8-a322-421f-a784-57933e57d5ad"}
      iex> MaiquiRoutine.Todos.Create.call todo_params
      {:ok, %MaiquiRoutine.Todo{}}

      iex> todo_params = %{description: "", task_id: "0eaface8-a322-421f-a784-57933e57d5ad"}
      iex> MaiquiRoutine.Todos.Create.call todo_params
      {:error,  %Ecto.Changeset{
        errors: [description: {"can't be blank", [validation: :required]}]
      }}

      iex> todo_params2 = %{description: "Learn 10 words in English", task_id: "0eaface8-a322-421f-a784-57933e57d5a1"}
      iex> MaiquiRoutine.Todos.Create.call todo_params2
      {:error, "Task not found"}

  """
  @spec call(Todo.params()) :: {:ok, Schema.t()} | {:error, Changeset.t()}
  def call(%{task_id: task_id} = params) when is_map(params) do
    with {:ok, %Task{}} <- Tasks.get_by_id(task_id) do
      %Todo{}
      |> Todo.changeset(params)
      |> Repo.insert()
    end
  end
end
