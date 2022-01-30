defmodule MaiquiRoutineWeb.Graphql.Types.Category do
  use Absinthe.Schema.Notation

  object :category do
    field :id, non_null(:uuid4)
    field :dark_color, non_null(:string)
    field :light_color, non_null(:string)
    field :name, non_null(:string)
    field :title_color, non_null(:string)
    field :user_id, non_null(:uuid4)
  end

  input_object :create_category_input do
    field :dark_color, non_null(:string), description: "Example: 2F9CF3"
    field :light_color, non_null(:string), description: "Example: BBDEFB"
    field :name, non_null(:string)
    field :title_color, non_null(:string), description: "Example: 456170"
    field :user_id, non_null(:uuid4)
  end
end
