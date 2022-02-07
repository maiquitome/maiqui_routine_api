defmodule MaiquiRoutineWeb.Graphql.Middlewares.Authorize do
  @behaviour Absinthe.Middleware

  def call(resolution, _role) when is_struct(resolution) do
    with %{current_user: _current_user} <- resolution.context do
      resolution
    else
      _ -> Absinthe.Resolution.put_result(resolution, {:error, "unauthorized"})
    end
  end
end
