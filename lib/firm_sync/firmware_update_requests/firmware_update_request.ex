defmodule FirmSync.FirmwareUpdateRequests.FirmwareUpdateRequest do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "firmware_update_requests" do
    field :status, Ecto.Enum, values: [:not_started, :in_progress, :completed, :failed, :verifying, :reverting, :cancelled]

    timestamps()
  end

  @doc false
  def changeset(firmware_update_request, attrs) do
    firmware_update_request
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end
