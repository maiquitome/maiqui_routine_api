defmodule MaiquiRoutine.Users do
  alias MaiquiRoutine.Users.{Create, Get}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_id(id), to: Get, as: :by_id
  defdelegate get_by_email(email), to: Get, as: :by_email
end
