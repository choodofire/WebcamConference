defmodule WebcamConference.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :name, :string
    field :description, :string
    field :gender, :boolean
    belongs_to :account, WebcamConferenceWeb.Accounts.Account

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:account_id, :name, :gender, :description])
    |> validate_required([:account_id])
  end
end
