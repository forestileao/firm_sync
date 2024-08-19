defmodule FirmSync.BoardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FirmSync.Boards` context.
  """

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        boardType: :esp_32,
        id: "7488a646-e31f-11e4-aace-600308960662",
        mac_address: "some mac_address",
        manufacturer: "some manufacturer",
        name: "some name"
      })
      |> FirmSync.Boards.create_board()

    board
  end
end
