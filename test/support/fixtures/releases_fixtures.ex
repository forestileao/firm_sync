defmodule FirmSync.ReleasesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FirmSync.Releases` context.
  """

  @doc """
  Generate a release.
  """
  def release_fixture(attrs \\ %{}) do
    {:ok, release} =
      attrs
      |> Enum.into(%{
        date: ~D[2024-08-18]
      })
      |> FirmSync.Releases.create_release()

    release
  end
end
