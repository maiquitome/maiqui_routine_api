defmodule MaiquiRoutine.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @type params() :: %{
          name: String.t(),
          start_time: Time.t(),
          end_time: Time.t(),
          category_id: binary(),
          user_id: binary(),
          weekdays: [:sun | :tue | :mon | :web | :thu | :fri | :sat]
        }

  @required_fields [
    :name,
    :start_time,
    :end_time,
    :category_id,
    :user_id,
    :weekdays
  ]

  @fields_that_can_be_changed [] ++ @required_fields

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :end_time, :time
    field :name, :string
    field :start_time, :time
    field :weekdays, {:array, Ecto.Enum}, values: [:sun, :tue, :mon, :web, :thu, :fri, :sat]

    belongs_to :user, MaiquiRoutine.User
    belongs_to :category, MaiquiRoutine.Category
    has_many :todos, MaiquiRoutine.Todo

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
  end
end
