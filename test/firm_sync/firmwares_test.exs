defmodule FirmSync.FirmwaresTest do
  use FirmSync.DataCase

  alias FirmSync.Firmwares

  describe "firmwares" do
    alias FirmSync.Firmwares.Firmware

    import FirmSync.FirmwaresFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_firmwares/0 returns all firmwares" do
      firmware = firmware_fixture()
      assert Firmwares.list_firmwares() == [firmware]
    end

    test "get_firmware!/1 returns the firmware with given id" do
      firmware = firmware_fixture()
      assert Firmwares.get_firmware!(firmware.id) == firmware
    end

    test "create_firmware/1 with valid data creates a firmware" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Firmware{} = firmware} = Firmwares.create_firmware(valid_attrs)
      assert firmware.name == "some name"
      assert firmware.description == "some description"
    end

    test "create_firmware/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Firmwares.create_firmware(@invalid_attrs)
    end

    test "update_firmware/2 with valid data updates the firmware" do
      firmware = firmware_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Firmware{} = firmware} = Firmwares.update_firmware(firmware, update_attrs)
      assert firmware.name == "some updated name"
      assert firmware.description == "some updated description"
    end

    test "update_firmware/2 with invalid data returns error changeset" do
      firmware = firmware_fixture()
      assert {:error, %Ecto.Changeset{}} = Firmwares.update_firmware(firmware, @invalid_attrs)
      assert firmware == Firmwares.get_firmware!(firmware.id)
    end

    test "delete_firmware/1 deletes the firmware" do
      firmware = firmware_fixture()
      assert {:ok, %Firmware{}} = Firmwares.delete_firmware(firmware)
      assert_raise Ecto.NoResultsError, fn -> Firmwares.get_firmware!(firmware.id) end
    end

    test "change_firmware/1 returns a firmware changeset" do
      firmware = firmware_fixture()
      assert %Ecto.Changeset{} = Firmwares.change_firmware(firmware)
    end
  end
end
