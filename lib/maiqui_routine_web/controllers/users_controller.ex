defmodule MaiquiRoutineWeb.UsersController do
  use MaiquiRoutineWeb, :controller

  use Absinthe.Phoenix.Controller,
    schema: MaiquiRoutineWeb.Schema,
    action: [mode: :internal]

  @graphql """
  {
    users{
      id
      name
      email
    }
  }
  """
  def index(conn, %{data: data}) when is_struct(conn) do
    conn
    |> put_status(:ok)
    |> render("users.json", data: data)
  end
end
