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

alias MaiquiRoutine.{
  Category,
  Categories,
  ColourPalette,
  ColourPalettes,
  Task,
  Tasks,
  User,
  Users
}

#####################
##### Colour Palettes
#####################
yellow_params = %{name: "yellow", light_colour: "FFD700", dark_colour: "D5B300", title_colour: "807959"}
{:ok, %ColourPalette{id: yellow_id}} = ColourPalettes.create yellow_params

%{name: "blue", light_colour: "BBDEFB", dark_colour: "2F9CF3", title_colour: "456170"}
|> ColourPalettes.create()

%{name: "red", light_colour: "FF8585", dark_colour: "BF4141", title_colour: "694949"}
|> ColourPalettes.create()

%{name: "green", light_colour: "61E194", dark_colour: "409762", title_colour: "41614D"}
|> ColourPalettes.create()

%{name: "rose", light_colour: "FADCD9", dark_colour: "F79489", title_colour: "B95C50"}
|> ColourPalettes.create()

%{name: "purple", light_colour: "D1C1FF", dark_colour: "8A6FDF", title_colour: "603F8B"}
|> ColourPalettes.create()

#####################
##### Maiqui User
#####################

# CREATE USER
user_params = %{name: "Maiqui", email: "maiqui@email.com", password: "12345678"}

{:ok, %User{id: user_id}} = Users.create(user_params)

# CREATE CATEGORY
category_params = %{
  user_id: user_id,
  colour_palette_id: yellow_id,
  name: "study",
}

{:ok, %Category{id: category_id}} = Categories.create(category_params)

# CREATE TASK
task_params = %{
  name: "english",
  start_time: ~T[05:30:00.000],
  end_time: ~T[06:00:00.000],
  category_id: category_id,
  user_id: user_id,
  weekdays: [:sun, :tue, :mon]
}

{:ok, %Task{id: _task_id}} = Tasks.create(task_params)

###################
##### Maiqui2 User
###################

# CREATE USER
user_params = %{name: "Maiqui2", email: "maiqui2@email.com", password: "12345678"}

{:ok, %User{id: user_id}} = Users.create(user_params)

# CREATE CATEGORY
category_params = %{
  user_id: user_id,
  colour_palette_id: yellow_id,
  name: "study",
}

{:ok, %Category{id: category_id}} = Categories.create(category_params)

# CREATE TASK
task_params = %{
  name: "english",
  start_time: ~T[05:30:00.000],
  end_time: ~T[06:00:00.000],
  category_id: category_id,
  user_id: user_id,
  weekdays: [:sun, :tue, :mon]
}

{:ok, %Task{id: _task_id}} = Tasks.create(task_params)
