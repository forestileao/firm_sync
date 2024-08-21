defmodule FirmSync.Firmwares.FirmwareVersion do
  use Ecto.Schema
  import Ecto.Changeset

  alias FirmSync.Firmwares.Firmware
  alias FirmSync.CloudFiles.CloudFile
  alias FirmSync.FirmwareUpdateRequests.FirmwareUpdateRequest

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "firmware_versions" do
    field :version, :string
    belongs_to :firmware, Firmware, foreign_key: :firmware_id
    belongs_to :cloud_file, CloudFile, foreign_key: :cloud_file_id
    has_many :firmware_update_requests, FirmwareUpdateRequest
    timestamps()
  end

  @doc false
  def changeset(firmware_version, attrs) do
    firmware_version
    |> cast(attrs, [:version])
    |> validate_required([:version])
  end
end
