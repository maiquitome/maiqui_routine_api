defmodule MaiquiRoutine.Categories do
  alias MaiquiRoutine.Categories.{Create, GetByName, GetAllByUserId}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_name(category_name, user_id), to: GetByName, as: :call
  defdelegate get_all_by_user_id(user_id), to: GetAllByUserId, as: :call
end
