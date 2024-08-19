defmodule FirmSync.FirmwareUpdateRequestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FirmSync.FirmwareUpdateRequests` context.
  """

  @doc """
  Generate a firmware_update_request.
  """
  def firmware_update_request_fixture(attrs \\ %{}) do
    {:ok, firmware_update_request} =
      attrs
      |> Enum.into(%{
        status: :not_started
      })
      |> FirmSync.FirmwareUpdateRequests.create_firmware_update_request()

    firmware_update_request
  end
end
