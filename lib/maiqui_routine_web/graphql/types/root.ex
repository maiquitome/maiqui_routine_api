defmodule MaiquiRoutineWeb.Graphql.Types.Root do
  use Absinthe.Schema.Notation

  # alias MaiquiRoutine.{User, Repo}

  alias MaiquiRoutineWeb.Graphql.{Middlewares, Resolvers}

  alias Resolvers.Auth, as: AuthResolver
  alias Resolvers.User, as: UserResolver
  alias Resolvers.Category, as: CategoryResolver
  alias Resolvers.Task, as: TaskResolver

  alias Middlewares.Log
  alias Middlewares.Authorize

  import_types MaiquiRoutineWeb.Graphql.Types

  import AbsintheErrorPayload.Payload
  import_types AbsintheErrorPayload.ValidationMessageTypes

  payload_object(:user_payload, :user)
  payload_object(:category_payload, :category)
  payload_object(:login_payload, :login)

  object :root_query do
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

    # @desc "Gets all users"
    # field :users, list_of(:user) do
    #   resolve fn _params, _context ->
    #     {:ok, Repo.all(User)}
    #   end
    # end

    @desc "Gets all categories"
    field :categories, list_of(:category) do
      arg :user_id, non_null(:uuid4)
      middleware(Authorize, :user)
      resolve &CategoryResolver.get_all/2
      middleware(Log)
    end

    @desc "Gets all tasks"
    field :tasks, list_of(:task) do
      arg :user_id, non_null(:uuid4)
      arg :weekday, non_null(:string)
      middleware(Authorize, :user)
      resolve &TaskResolver.get_all_by_weekday/2
      middleware(Log)
    end
  end

  object :root_mutation do
    @desc "Login with a user and then return a JWT token"
    field :do_login, type: :login_payload do
      arg :input, non_null(:create_login_input)
      resolve &AuthResolver.login/2
      middleware(&build_payload/2)
      middleware(Log)
    end

    @desc "Creates a new user"
    field :create_user, type: :user_payload do
      arg :input, non_null(:create_user_input)
      middleware(Authorize, :user)
      resolve &UserResolver.create/2
      middleware(&build_payload/2)
      middleware(Log)
    end

    @desc "Creates a new category"
    field :create_category, type: :category_payload do
      arg :input, non_null(:create_category_input)
      middleware(Authorize, :user)
      resolve &CategoryResolver.create/2
      middleware(&build_payload/2)
      middleware(Log)
    end
  end
end
