# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MaiquiRoutine.Repo.insert!(%MaiquiRoutine.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#####################
##### Maiqui User
#####################

alias MaiquiRoutine.{Category, Categories, Task, Tasks, User, Users}

# CREATE USER
user_params = %{name: "Maiqui", email: "maiqui@email.com", password: "12345678"}

{:ok,  %User{id: user_id}} = Users.create user_params

# CREATE CATEGORY
category_params = %{
  user_id: user_id,
  name: "study",
  dark_color: "2F9CF3",
  light_color: "BBDEFB",
  title_color: "456170"
}

{:ok,  %Category{id: category_id}} = Categories.create category_params

# CREATE TASK
task_params = %{
  name: "english",
  start_time: ~T[05:30:00.000],
  end_time: ~T[06:00:00.000],
  category_id: category_id,
  user_id: user_id,
  weekdays: [:sun, :tue, :mon]
}

{:ok,  %Task{id: _task_id}} = Tasks.create task_params
