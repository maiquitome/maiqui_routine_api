defmodule MaiquiRoutineWeb.UsersView do
  use MaiquiRoutineWeb, :view

  def render("users.json", %{data: %{users: users}}) when is_list(users) do
    %{users: render_many(users, MaiquiRoutineWeb.UsersView, "user.json", as: :user)}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end
