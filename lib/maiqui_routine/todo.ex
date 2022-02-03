defmodule MaiquiRoutine.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  @type params() :: %{
    description: String.t(),
    checked: boolean(),
    task_id: binary()
  }

  @required_fields [
    :description,
    :task_id
  ]

  @fields_that_can_be_changed [:checked] ++ @required_fields

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "todos" do
    field :checked, :boolean, default: false
    field :description, :string

    belongs_to :task, MaiquiRoutine.Task

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
  end
end
