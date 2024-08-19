defmodule FirmSync.Releases.Release do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "releases" do
    field :date, :date

    timestamps()
  end

  @doc false
  def changeset(release, attrs) do
    release
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
