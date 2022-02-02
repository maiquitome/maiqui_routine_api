defmodule MaiquiRoutineWeb.Graphql.Types.Root do
  use Absinthe.Schema.Notation

  # alias MaiquiRoutine.{User, Repo}

  alias MaiquiRoutineWeb.Graphql.Resolvers.User, as: UserResolver
  alias MaiquiRoutineWeb.Graphql.Resolvers.Category, as: CategoryResolver
  alias MaiquiRoutineWeb.Graphql.Middlewares.Log

  import_types MaiquiRoutineWeb.Graphql.Types

  import AbsintheErrorPayload.Payload
  import_types AbsintheErrorPayload.ValidationMessageTypes

  payload_object(:user_payload, :user)
  payload_object(:category_payload, :category)

  object :root_query do
    @desc "Get user by id"
    field :user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get_by_id/2
      middleware Log
    end

    @desc "Gets all users"
    field :users, list_of(:user) do
      resolve &UserResolver.all/2
      middleware Log
    end

    # @desc "Gets all users"
    # field :users, list_of(:user) do
    #   resolve fn _params, _context ->
    #     {:ok, Repo.all(User)}
    #   end
    # end

    @desc "Gets all categories"
    field :categories, list_of(:category) do
      arg :user_id, non_null(:uuid4)

      resolve &CategoryResolver.get_all/2
      middleware Log
    end
  end

  object :root_mutation do
    @desc "Creates a new user"
    field :create_user, type: :user_payload do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
      middleware(&build_payload/2)
      middleware Log
    end

    @desc "Creates a new category"
    field :create_category, type: :category_payload do
      arg :input, non_null(:create_category_input)

      resolve &CategoryResolver.create/2
      middleware(&build_payload/2)
      middleware Log
    end
  end
end