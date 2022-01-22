defmodule MaiquiRoutine.User do
  use Ecto.Schema
  import Ecto.Changeset

  @type params() :: %{
    name: String.t(),
    email: String.t(),
    password: String.t()
  }

  @fields_that_can_be_changed [
    :email,
    :name,
    :password
  ]

  @required_fields [
    :email,
    :name,
    :password
  ]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> validate_length(:password, min: 8)
    |> validate_format(:email, ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i)
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
