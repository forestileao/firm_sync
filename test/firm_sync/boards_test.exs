defmodule FirmSync.BoardsTest do
  use FirmSync.DataCase

  alias FirmSync.Boards

  describe "boards" do
    alias FirmSync.Boards.Board

    import FirmSync.BoardsFixtures

    @invalid_attrs %{id: nil, name: nil, boardType: nil, manufacturer: nil, mac_address: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Boards.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Boards.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", name: "some name", boardType: :esp_32, manufacturer: "some manufacturer", mac_address: "some mac_address"}

      assert {:ok, %Board{} = board} = Boards.create_board(valid_attrs)
      assert board.id == "7488a646-e31f-11e4-aace-600308960662"
      assert board.name == "some name"
      assert board.boardType == :esp_32
      assert board.manufacturer == "some manufacturer"
      assert board.mac_address == "some mac_address"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name", boardType: :arduino, manufacturer: "some updated manufacturer", mac_address: "some updated mac_address"}

      assert {:ok, %Board{} = board} = Boards.update_board(board, update_attrs)
      assert board.id == "7488a646-e31f-11e4-aace-600308960668"
      assert board.name == "some updated name"
      assert board.boardType == :arduino
      assert board.manufacturer == "some updated manufacturer"
      assert board.mac_address == "some updated mac_address"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_board(board, @invalid_attrs)
      assert board == Boards.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Boards.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Boards.change_board(board)
    end
  end
end
