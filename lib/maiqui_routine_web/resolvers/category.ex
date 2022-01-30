defmodule MaiquiRoutineWeb.Resolvers.Category do
  alias MaiquiRoutine.{Categories}

  def get_by_name(%{category_name: category_name, user_id: user_id}, _context), do: Categories.get_by_name(category_name, user_id)
  def create(%{input: params}, _context), do: Categories.create(params)
  def get_all(%{user_id: id}, _context), do: Categories.get_all_by_user_id(id)
end
