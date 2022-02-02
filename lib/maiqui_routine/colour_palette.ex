defmodule MaiquiRoutine.ColourPalette do
  use Ecto.Schema
  import Ecto.Changeset

  @type params() :: %{
    name: String.t(),
    dark_colour: String.t(),
    light_colour: String.t(),
    title_colour: String.t()
  }

  @required_fields [
    :name,
    :dark_colour,
    :light_colour,
    :title_colour
  ]

  @fields_that_can_be_changed [] ++ @required_fields

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "colour_palettes" do
    field :name, :string
    field :dark_colour, :string
    field :light_colour, :string
    field :title_colour, :string

    has_many :categories, MaiquiRoutine.Category

    timestamps()
  end

  @doc false
  def changeset(colour_palette, attrs) do
    colour_palette
    |> cast(attrs, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> unique_constraint(:name)
  end
end
