defmodule FirmSync.Boards.Board do
  use Ecto.Schema
  import Ecto.Changeset

  @available_board_types [:esp_32, :arduino]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "boards" do
    field :name, :string
    field :boardType, Ecto.Enum, values: @available_board_types
    field :manufacturer, :string
    field :mac_address, :string

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name, :boardType, :manufacturer, :mac_address])
    |> validate_required([:name, :boardType, :manufacturer, :mac_address])
  end
end
