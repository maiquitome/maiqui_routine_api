defmodule MaiquiRoutine.Tasks do
  alias MaiquiRoutine.Tasks.{Create, GetById, GetAllByWeekday}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_id(id), to: GetById, as: :call
  defdelegate get_all_by_weekday(weekday, user_id), to: GetAllByWeekday, as: :call
end
