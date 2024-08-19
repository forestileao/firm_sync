defmodule FirmSync.CloudFilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FirmSync.CloudFiles` context.
  """

  @doc """
  Generate a cloud_file.
  """
  def cloud_file_fixture(attrs \\ %{}) do
    {:ok, cloud_file} =
      attrs
      |> Enum.into(%{
        bucket_base_url: "some bucket_base_url",
        bucket_name: "some bucket_name",
        key: "some key",
        mime_type: "some mime_type",
        size: 42
      })
      |> FirmSync.CloudFiles.create_cloud_file()

    cloud_file
  end
end
