defmodule MaiquiRoutineWeb.Graphql.Types.Category do
  use Absinthe.Schema.Notation

  object :category do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :user_id, non_null(:uuid4)
    field :colour_palette_id, non_null(:uuid4)
  end

  input_object :create_category_input do
    field :name, non_null(:string)
    field :user_id, non_null(:uuid4)
    field :colour_palette_id, non_null(:uuid4)
  end
end
