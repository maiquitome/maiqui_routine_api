defmodule MaiquiRoutineWeb.Resolvers.User do
  alias MaiquiRoutine.Users

  def get(%{id: user_id}, _context), do: Users.get(user_id)
  def create(%{input: params}, _context), do: Users.create(params)
end
