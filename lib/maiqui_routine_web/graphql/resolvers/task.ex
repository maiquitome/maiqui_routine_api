defmodule MaiquiRoutineWeb.Graphql.Resolvers.Task do
  alias MaiquiRoutine.Tasks

  def get_all_by_weekday(%{weekday: weekday, user_id: user_id}, _context) do
    Tasks.get_all_by_weekday(weekday, user_id)
  end
end
