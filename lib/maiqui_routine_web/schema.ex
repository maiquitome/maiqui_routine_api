defmodule MaiquiRoutineWeb.Schema do
  use Absinthe.Schema

  import_types MaiquiRoutineWeb.Schema.Types.Root

  query do
    import_fields :root_query
  end
end
