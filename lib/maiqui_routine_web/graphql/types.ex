defmodule MaiquiRoutineWeb.Graphql.Types do
  use Absinthe.Schema.Notation

  alias MaiquiRoutineWeb.Graphql.Types

  import_types Absinthe.Type.Custom

  import_types AbsintheErrorPayload.ValidationMessageTypes
  
  import_types Types.Auth
  import_types Types.Category
  import_types Types.Custom.UUID4
  import_types Types.Task
  import_types Types.User
end
