defmodule MaiquiRoutine.Tasks.Create do
  alias MaiquiRoutine.{Repo, Task}
  alias Ecto.{Changeset, Schema}

  @doc """
  ### Examples

      iex> alias MaiquiRoutine.{Category, Categories, Task, Tasks, User, Users}

      iex> {:ok, %User{id: user_id}} = Users.get_by_email "maiqui@email.com"

      iex> {:ok, %Category{id: category_id}} = Categories.get_by_name "study", user_id

      iex> task_params = %{weekdays: [:sun, :sat], name: "english", start_time: ~T[05:30:00.000], end_time: ~T[06:00:00.000], category_id: category_id, user_id: user_id}

      iex> Tasks.Create.call task_params
      {:ok, %Task{}}

  """
  @spec call(Task.params()) :: {:ok, Schema} | {:error, Changeset}
  def call(params) when is_map(params) do
    %Task{}
    |> Task.changeset(params)
    |> Repo.insert()
  end
end
