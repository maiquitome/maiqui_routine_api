defmodule MaiquiRoutine.Tasks do
  alias MaiquiRoutine.Tasks.{Create, GetById}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_id(id), to: GetById, as: :call
end
