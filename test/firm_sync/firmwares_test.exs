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

  describe "firmware_versions" do
    alias FirmSync.Firmwares.FirmwareVersion

    import FirmSync.FirmwaresFixtures

    @invalid_attrs %{version: nil}

    test "list_firmware_versions/0 returns all firmware_versions" do
      firmware_version = firmware_version_fixture()
      assert Firmwares.list_firmware_versions() == [firmware_version]
    end

    test "get_firmware_version!/1 returns the firmware_version with given id" do
      firmware_version = firmware_version_fixture()
      assert Firmwares.get_firmware_version!(firmware_version.id) == firmware_version
    end

    test "create_firmware_version/1 with valid data creates a firmware_version" do
      valid_attrs = %{version: "some version"}

      assert {:ok, %FirmwareVersion{} = firmware_version} = Firmwares.create_firmware_version(valid_attrs)
      assert firmware_version.version == "some version"
    end

    test "create_firmware_version/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Firmwares.create_firmware_version(@invalid_attrs)
    end

    test "update_firmware_version/2 with valid data updates the firmware_version" do
      firmware_version = firmware_version_fixture()
      update_attrs = %{version: "some updated version"}

      assert {:ok, %FirmwareVersion{} = firmware_version} = Firmwares.update_firmware_version(firmware_version, update_attrs)
      assert firmware_version.version == "some updated version"
    end

    test "update_firmware_version/2 with invalid data returns error changeset" do
      firmware_version = firmware_version_fixture()
      assert {:error, %Ecto.Changeset{}} = Firmwares.update_firmware_version(firmware_version, @invalid_attrs)
      assert firmware_version == Firmwares.get_firmware_version!(firmware_version.id)
    end

    test "delete_firmware_version/1 deletes the firmware_version" do
      firmware_version = firmware_version_fixture()
      assert {:ok, %FirmwareVersion{}} = Firmwares.delete_firmware_version(firmware_version)
      assert_raise Ecto.NoResultsError, fn -> Firmwares.get_firmware_version!(firmware_version.id) end
    end

    test "change_firmware_version/1 returns a firmware_version changeset" do
      firmware_version = firmware_version_fixture()
      assert %Ecto.Changeset{} = Firmwares.change_firmware_version(firmware_version)
    end
  end
end
