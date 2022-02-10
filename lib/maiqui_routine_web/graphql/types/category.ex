defmodule MaiquiRoutineWeb.Graphql.Types.Category do
  use Absinthe.Schema.Notation

  alias MaiquiRoutineWeb.Graphql.Middlewares.{Authorize, Log}
  alias MaiquiRoutineWeb.Graphql.Resolvers.Category, as: CategoryResolver

  import AbsintheErrorPayload.Payload
  payload_object(:category_payload, :category)

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

  object :category_queries do
    @desc "Gets all categories"
    field :categories, list_of(:category) do
      arg :user_id, non_null(:uuid4)
      middleware(Authorize, :user)
      resolve &CategoryResolver.get_all/2
      middleware(Log)
    end
  end

  object :category_mutation do
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
