defmodule MaiquiRoutine.Users do
  alias MaiquiRoutine.Users.{Create, GetById, GetByEmail}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_id(id), to: GetById, as: :call
  defdelegate get_by_email(email), to: GetByEmail, as: :call
end
