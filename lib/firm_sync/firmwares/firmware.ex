defmodule FirmSync.Firmwares.Firmware do
  use Ecto.Schema
  import Ecto.Changeset

  alias FirmSync.Firmwares.FirmwareVersion

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "firmwares" do
    field :name, :string
    field :description, :string
    has_many :versions, FirmwareVersion
    timestamps()
  end

  @doc false
  def changeset(firmware, attrs) do
    firmware
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
