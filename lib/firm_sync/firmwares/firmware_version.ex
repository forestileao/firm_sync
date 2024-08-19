defmodule FirmSync.Firmwares.FirmwareVersion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "firmware_versions" do
    field :version, :string

    timestamps()
  end

  @doc false
  def changeset(firmware_version, attrs) do
    firmware_version
    |> cast(attrs, [:version])
    |> validate_required([:version])
  end
end
