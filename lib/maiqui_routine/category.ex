defmodule MaiquiRoutine.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @type params() :: %{
          dark_color: String.t(),
          light_color: String.t(),
          name: String.t(),
          title_color: String.t()
        }

  @required_fields [
    :name,
    :dark_color,
    :light_color,
    :title_color,
    :user_id
  ]

  @fields_that_can_be_changed [] ++ @required_fields

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :dark_color, :string
    field :light_color, :string
    field :name, :string
    field :title_color, :string

    belongs_to :user, MaiquiRoutine.User
    has_many :tasks, MaiquiRoutine.Task

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> unique_constraint([:user_id, :name])
  end
end
