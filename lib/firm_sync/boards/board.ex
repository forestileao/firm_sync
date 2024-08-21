defmodule FirmSync.Boards.Board do
  use Ecto.Schema
  import Ecto.Changeset

  alias FirmSync.FirmwareUpdateRequests.FirmwareUpdateRequest

  @available_board_types [:esp_32, :arduino]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "boards" do
    field :name, :string
    field :boardType, Ecto.Enum, values: @available_board_types
    field :manufacturer, :string
    field :mac_address, :string
    has_many :firmware_update_requests, FirmwareUpdateRequest
    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name, :boardType, :manufacturer, :mac_address])
    |> validate_required([:name, :boardType, :manufacturer, :mac_address])
  end
end
