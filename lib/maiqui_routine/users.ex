defmodule MaiquiRoutine.Users do
  alias MaiquiRoutine.Users.{Create, Get}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_id(id), to: Get, as: :by_id
end
