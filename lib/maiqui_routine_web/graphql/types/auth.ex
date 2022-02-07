defmodule MaiquiRoutineWeb.Graphql.Types.Auth do
  use Absinthe.Schema.Notation

  object :login do
    field :token, non_null(:string)
    field :user, non_null(:user)
  end

  input_object :create_login_input do
    field :email, non_null(:string)
    field :password, non_null(:string)
  end
end
