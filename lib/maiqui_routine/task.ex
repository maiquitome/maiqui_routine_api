defmodule MaiquiRoutine.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :end_time, :time
    field :name, :string
    field :start_time, :time

    belongs_to :user, MaiquiRoutine.User
    belongs_to :category, MaiquiRoutine.Category

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :start_time, :end_time])
    |> validate_required([:name, :start_time, :end_time])
  end
end
