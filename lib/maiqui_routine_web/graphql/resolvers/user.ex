defmodule MaiquiRoutineWeb.Graphql.Resolvers.User do
  alias MaiquiRoutine.{User, Users, Repo}

  def get_by_id(%{id: user_id}, _context), do: Users.get_by_id(user_id)
  def create(%{input: params}, _context), do: Users.create(params)
  def all(_params, _context), do: {:ok, Repo.all(User)}
end
