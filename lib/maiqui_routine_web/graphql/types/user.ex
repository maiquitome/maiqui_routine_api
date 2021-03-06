defmodule MaiquiRoutineWeb.Graphql.Types.User do
  use Absinthe.Schema.Notation

  alias MaiquiRoutineWeb.Graphql.Middlewares.{Authorize, Log}
  alias MaiquiRoutineWeb.Graphql.Resolvers.User, as: UserResolver

  import AbsintheErrorPayload.Payload
  payload_object(:user_payload, :user)

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

  object :user_queries do
    @desc "Get user by id"
    field :user, type: :user do
      arg :id, non_null(:uuid4)
      middleware(Authorize, :user)
      resolve &UserResolver.get_by_id/2
      middleware(Log)
    end

    @desc "Gets all users"
    field :users, list_of(:user) do
      middleware(Authorize, :user)
      resolve &UserResolver.all/2
      middleware(Log)
    end
  end

  object :user_mutation do
    @desc "Creates a new user"
    field :create_user, type: :user_payload do
      arg :input, non_null(:create_user_input)
      middleware(Authorize, :user)
      resolve &UserResolver.create/2
      middleware(&build_payload/2)
      middleware(Log)
    end
  end
end
