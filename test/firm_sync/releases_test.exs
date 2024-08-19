defmodule FirmSync.ReleasesTest do
  use FirmSync.DataCase

  alias FirmSync.Releases

  describe "releases" do
    alias FirmSync.Releases.Release

    import FirmSync.ReleasesFixtures

    @invalid_attrs %{date: nil}

    test "list_releases/0 returns all releases" do
      release = release_fixture()
      assert Releases.list_releases() == [release]
    end

    test "get_release!/1 returns the release with given id" do
      release = release_fixture()
      assert Releases.get_release!(release.id) == release
    end

    test "create_release/1 with valid data creates a release" do
      valid_attrs = %{date: ~D[2024-08-18]}

      assert {:ok, %Release{} = release} = Releases.create_release(valid_attrs)
      assert release.date == ~D[2024-08-18]
    end

    test "create_release/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Releases.create_release(@invalid_attrs)
    end

    test "update_release/2 with valid data updates the release" do
      release = release_fixture()
      update_attrs = %{date: ~D[2024-08-19]}

      assert {:ok, %Release{} = release} = Releases.update_release(release, update_attrs)
      assert release.date == ~D[2024-08-19]
    end

    test "update_release/2 with invalid data returns error changeset" do
      release = release_fixture()
      assert {:error, %Ecto.Changeset{}} = Releases.update_release(release, @invalid_attrs)
      assert release == Releases.get_release!(release.id)
    end

    test "delete_release/1 deletes the release" do
      release = release_fixture()
      assert {:ok, %Release{}} = Releases.delete_release(release)
      assert_raise Ecto.NoResultsError, fn -> Releases.get_release!(release.id) end
    end

    test "change_release/1 returns a release changeset" do
      release = release_fixture()
      assert %Ecto.Changeset{} = Releases.change_release(release)
    end
  end
end
