defmodule MaiquiRoutine.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :dark_color, :integer
    field :light_color, :integer
    field :name, :string
    field :title_color, :integer

    belongs_to :user, MaiquiRoutine.User
    has_many :tasks, MaiquiRoutine.Task

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :dark_color, :light_color, :title_color])
    |> validate_required([:name, :dark_color, :light_color, :title_color])
  end
end
