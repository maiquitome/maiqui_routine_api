defmodule MaiquiRoutineWeb.Graphql.Schema do
  use Absinthe.Schema

  import_types MaiquiRoutineWeb.Graphql.Types

  query do
    import_fields :user_queries
    import_fields :task_queries
    import_fields :category_queries
  end

  mutation do
    import_fields :auth_mutation
    import_fields :user_mutation
    import_fields :category_mutation
  end
end
