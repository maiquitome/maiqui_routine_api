defmodule MaiquiRoutine.Users do
  alias MaiquiRoutine.Users.{Create, Get}

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
end
