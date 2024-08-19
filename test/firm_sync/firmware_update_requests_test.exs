defmodule FirmSync.FirmwareUpdateRequestsTest do
  use FirmSync.DataCase

  alias FirmSync.FirmwareUpdateRequests

  describe "firmware_update_requests" do
    alias FirmSync.FirmwareUpdateRequests.FirmwareUpdateRequest

    import FirmSync.FirmwareUpdateRequestsFixtures

    @invalid_attrs %{status: nil}

    test "list_firmware_update_requests/0 returns all firmware_update_requests" do
      firmware_update_request = firmware_update_request_fixture()
      assert FirmwareUpdateRequests.list_firmware_update_requests() == [firmware_update_request]
    end

    test "get_firmware_update_request!/1 returns the firmware_update_request with given id" do
      firmware_update_request = firmware_update_request_fixture()
      assert FirmwareUpdateRequests.get_firmware_update_request!(firmware_update_request.id) == firmware_update_request
    end

    test "create_firmware_update_request/1 with valid data creates a firmware_update_request" do
      valid_attrs = %{status: :not_started}

      assert {:ok, %FirmwareUpdateRequest{} = firmware_update_request} = FirmwareUpdateRequests.create_firmware_update_request(valid_attrs)
      assert firmware_update_request.status == :not_started
    end

    test "create_firmware_update_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FirmwareUpdateRequests.create_firmware_update_request(@invalid_attrs)
    end

    test "update_firmware_update_request/2 with valid data updates the firmware_update_request" do
      firmware_update_request = firmware_update_request_fixture()
      update_attrs = %{status: :in_progress}

      assert {:ok, %FirmwareUpdateRequest{} = firmware_update_request} = FirmwareUpdateRequests.update_firmware_update_request(firmware_update_request, update_attrs)
      assert firmware_update_request.status == :in_progress
    end

    test "update_firmware_update_request/2 with invalid data returns error changeset" do
      firmware_update_request = firmware_update_request_fixture()
      assert {:error, %Ecto.Changeset{}} = FirmwareUpdateRequests.update_firmware_update_request(firmware_update_request, @invalid_attrs)
      assert firmware_update_request == FirmwareUpdateRequests.get_firmware_update_request!(firmware_update_request.id)
    end

    test "delete_firmware_update_request/1 deletes the firmware_update_request" do
      firmware_update_request = firmware_update_request_fixture()
      assert {:ok, %FirmwareUpdateRequest{}} = FirmwareUpdateRequests.delete_firmware_update_request(firmware_update_request)
      assert_raise Ecto.NoResultsError, fn -> FirmwareUpdateRequests.get_firmware_update_request!(firmware_update_request.id) end
    end

    test "change_firmware_update_request/1 returns a firmware_update_request changeset" do
      firmware_update_request = firmware_update_request_fixture()
      assert %Ecto.Changeset{} = FirmwareUpdateRequests.change_firmware_update_request(firmware_update_request)
    end
  end
end
