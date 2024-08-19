defmodule FirmSync.FirmwaresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FirmSync.Firmwares` context.
  """

  @doc """
  Generate a firmware.
  """
  def firmware_fixture(attrs \\ %{}) do
    {:ok, firmware} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> FirmSync.Firmwares.create_firmware()

    firmware
  end

  @doc """
  Generate a firmware_version.
  """
  def firmware_version_fixture(attrs \\ %{}) do
    {:ok, firmware_version} =
      attrs
      |> Enum.into(%{
        version: "some version"
      })
      |> FirmSync.Firmwares.create_firmware_version()

    firmware_version
  end
end
