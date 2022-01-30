defmodule MaiquiRoutineWeb.Graphql.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:uuid4)
    field :email, non_null(:string)
    field :name, non_null(:string)
  end

  input_object :create_user_input do
    field :email, non_null(:string)
    field :name, non_null(:string), description: "User Name"
    field :password, non_null(:string)
  end
end
