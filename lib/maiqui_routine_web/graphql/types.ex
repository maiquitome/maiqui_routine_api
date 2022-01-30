defmodule MaiquiRoutineWeb.Graphql.Types do
  use Absinthe.Schema.Notation

  alias MaiquiRoutineWeb.Graphql.Types

  import_types Types.User
  import_types Types.Category
  import_types Types.Custom.UUID4
end
