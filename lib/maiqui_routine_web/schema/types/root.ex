defmodule MaiquiRoutineWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias MaiquiRoutineWeb.Schema.Types
  alias MaiquiRoutineWeb.Resolvers.User, as: UserResolver

  import_types Types.User
  import_types Types.Custom.UUID4

  object :root_query do
    @desc "Get user by id"
    field :user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
    end
  end
end
