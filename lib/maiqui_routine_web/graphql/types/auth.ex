defmodule MaiquiRoutineWeb.Graphql.Types.Auth do
  use Absinthe.Schema.Notation

  alias MaiquiRoutineWeb.Graphql.Middlewares.Log
  alias MaiquiRoutineWeb.Graphql.Resolvers.Auth, as: AuthResolver

  import AbsintheErrorPayload.Payload

  payload_object(:login_payload, :login)

  object :login do
    field :token, non_null(:string)
    field :user, non_null(:user)
  end

  input_object :create_login_input do
    field :email, non_null(:string)
    field :password, non_null(:string)
  end

  object :auth_mutation do
    @desc "Login with a user and then return a JWT token"
    field :do_login, type: :login_payload do
      arg :input, non_null(:create_login_input)
      resolve &AuthResolver.login/2
      middleware(&build_payload/2)
      middleware(Log)
    end
  end
end
