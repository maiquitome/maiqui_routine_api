defmodule MaiquiRoutineWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias MaiquiRoutineWeb.Schema.Types
  alias MaiquiRoutineWeb.Resolvers.User, as: UserResolver
  alias MaiquiRoutineWeb.Middlewares.Log

  import_types Types.User
  import_types Types.Custom.UUID4

  object :root_query do
    @desc "Get user by id"
    field :user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
      middleware Log
    end
  end

  object :root_mutation do
    @desc "Creates a new user"
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
      middleware Log
    end
  end
end
