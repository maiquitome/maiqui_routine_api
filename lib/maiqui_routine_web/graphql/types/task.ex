defmodule MaiquiRoutineWeb.Graphql.Types.Task do
  use Absinthe.Schema.Notation

  object :task do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :start_time, non_null(:time)
    field :end_time, non_null(:time)
    field :category_id, non_null(:uuid4)
    field :user_id, non_null(:uuid4)
    field :weekdays, non_null(list_of(:weekdays))
  end

  input_object :create_task_input do
    field :name, non_null(:string)
    field :start_time, non_null(:time)
    field :end_time, non_null(:time)
    field :category_id, non_null(:uuid4)
    field :user_id, non_null(:uuid4)
    field :weekdays, non_null(list_of(:weekdays))
  end

  enum :weekdays, values: [:sun, :mon, :tue, :wed, :thu, :fri, :sat]
end
