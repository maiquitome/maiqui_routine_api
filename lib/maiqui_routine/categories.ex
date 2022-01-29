defmodule MaiquiRoutine.Categories do
  alias MaiquiRoutine.Categories.{Create, GetByName}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_name(category_name, user_id), to: GetByName, as: :call
end
