defmodule MaiquiRoutineWeb.Auth.Guardian do
  use Guardian, otp_app: :maiqui_routine

  alias MaiquiRoutine.{User, Users}

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}
  def subject_for_token(_, _), do: {:error, "Unknown resource type"}

  def resource_from_claims(%{"sub" => id}), do: {:ok, Users.get_by_id(id)}
  def resource_from_claims(_claims), do: {:error, "Unknown resource type"}

  @spec verify(Guardian.Token.token) :: {:ok, Guardian.Token.claims} | {:error, any}
  def verify(token) do
    decode_and_verify(token)
  end

  @doc """
    iex> alias MaiquiRoutineWeb.Auth.Guardian

    ### Success Example:
      iex> credentials = %{
        email: "maiqui@email.com",
        password: "12345678"
      }

      iex> Guardian.authenticate credentials
      {:ok, %{token: token, user: user}}

    ### User not found:
      iex> credentials = %{
        email: "maiqui@email",
        password: "12345678"
      }

      iex> Guardian.authenticate credentials
      {:error, "User not found. Please check email."}

    ### Invalid Password:
      iex> credentials = %{
        email: "maiqui@email.com",
        password: "12345677"
      }

      iex> Guardian.authenticate credentials
      {:error, "invalid password"}

  """
  def authenticate(%{email: email, password: password}) do
    with {:ok, %User{} = user} <- Users.get_by_email(email),
         {:ok, %User{} = user} <- Argon2.check_pass(user, password),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, %{token: token, user: user}}
    end
  end

  def authenticate(_), do: {:error, "Invalid or missing params"}
end
