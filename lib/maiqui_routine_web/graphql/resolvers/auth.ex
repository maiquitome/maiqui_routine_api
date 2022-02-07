defmodule MaiquiRoutineWeb.Graphql.Resolvers.Auth do
  alias MaiquiRoutineWeb.Auth.Guardian

  def login(%{input: credentials}, _context) do
    Guardian.authenticate(credentials)
  end
end
