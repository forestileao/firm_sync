defmodule FirmSync.CloudFilesTest do
  use FirmSync.DataCase

  alias FirmSync.CloudFiles

  describe "cloud_files" do
    alias FirmSync.CloudFiles.CloudFile

    import FirmSync.CloudFilesFixtures

    @invalid_attrs %{size: nil, key: nil, bucket_name: nil, bucket_base_url: nil, mime_type: nil}

    test "list_cloud_files/0 returns all cloud_files" do
      cloud_file = cloud_file_fixture()
      assert CloudFiles.list_cloud_files() == [cloud_file]
    end

    test "get_cloud_file!/1 returns the cloud_file with given id" do
      cloud_file = cloud_file_fixture()
      assert CloudFiles.get_cloud_file!(cloud_file.id) == cloud_file
    end

    test "create_cloud_file/1 with valid data creates a cloud_file" do
      valid_attrs = %{size: 42, key: "some key", bucket_name: "some bucket_name", bucket_base_url: "some bucket_base_url", mime_type: "some mime_type"}

      assert {:ok, %CloudFile{} = cloud_file} = CloudFiles.create_cloud_file(valid_attrs)
      assert cloud_file.size == 42
      assert cloud_file.key == "some key"
      assert cloud_file.bucket_name == "some bucket_name"
      assert cloud_file.bucket_base_url == "some bucket_base_url"
      assert cloud_file.mime_type == "some mime_type"
    end

    test "create_cloud_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CloudFiles.create_cloud_file(@invalid_attrs)
    end

    test "update_cloud_file/2 with valid data updates the cloud_file" do
      cloud_file = cloud_file_fixture()
      update_attrs = %{size: 43, key: "some updated key", bucket_name: "some updated bucket_name", bucket_base_url: "some updated bucket_base_url", mime_type: "some updated mime_type"}

      assert {:ok, %CloudFile{} = cloud_file} = CloudFiles.update_cloud_file(cloud_file, update_attrs)
      assert cloud_file.size == 43
      assert cloud_file.key == "some updated key"
      assert cloud_file.bucket_name == "some updated bucket_name"
      assert cloud_file.bucket_base_url == "some updated bucket_base_url"
      assert cloud_file.mime_type == "some updated mime_type"
    end

    test "update_cloud_file/2 with invalid data returns error changeset" do
      cloud_file = cloud_file_fixture()
      assert {:error, %Ecto.Changeset{}} = CloudFiles.update_cloud_file(cloud_file, @invalid_attrs)
      assert cloud_file == CloudFiles.get_cloud_file!(cloud_file.id)
    end

    test "delete_cloud_file/1 deletes the cloud_file" do
      cloud_file = cloud_file_fixture()
      assert {:ok, %CloudFile{}} = CloudFiles.delete_cloud_file(cloud_file)
      assert_raise Ecto.NoResultsError, fn -> CloudFiles.get_cloud_file!(cloud_file.id) end
    end

    test "change_cloud_file/1 returns a cloud_file changeset" do
      cloud_file = cloud_file_fixture()
      assert %Ecto.Changeset{} = CloudFiles.change_cloud_file(cloud_file)
    end
  end
end
