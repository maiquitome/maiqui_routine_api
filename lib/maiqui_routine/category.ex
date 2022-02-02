defmodule MaiquiRoutine.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @type params() :: %{
          name: String.t(),
          user_id: binary(),
          colour_palette_id: binary()
        }

  @required_fields [
    :name,
    :user_id,
    :colour_palette_id
  ]

  @fields_that_can_be_changed [] ++ @required_fields

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :name, :string

    belongs_to :user, MaiquiRoutine.User
    has_many :tasks, MaiquiRoutine.Task

    belongs_to :colour_palette, MaiquiRoutine.ColourPalette

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
