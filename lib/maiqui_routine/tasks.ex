defmodule MaiquiRoutine.Tasks do
  alias MaiquiRoutine.Tasks.Create

  defdelegate create(params), to: Create, as: :call
end
