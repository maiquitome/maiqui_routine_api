defmodule MaiquiRoutine.Todos do
  alias MaiquiRoutine.Todos.Create

  defdelegate create(params), to: Create, as: :call
end
