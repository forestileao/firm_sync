defmodule FirmSync.CloudFiles do
  @moduledoc """
  The CloudFiles context.
  """

  import Ecto.Query, warn: false
  alias FirmSync.Repo

  alias FirmSync.CloudFiles.CloudFile

  @doc """
  Returns the list of cloud_files.

  ## Examples

      iex> list_cloud_files()
      [%CloudFile{}, ...]

  """
  def list_cloud_files do
    Repo.all(CloudFile)
  end

  @doc """
  Gets a single cloud_file.

  Raises `Ecto.NoResultsError` if the Cloud file does not exist.

  ## Examples

      iex> get_cloud_file!(123)
      %CloudFile{}

      iex> get_cloud_file!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cloud_file!(id), do: Repo.get!(CloudFile, id)

  @doc """
  Creates a cloud_file.

  ## Examples

      iex> create_cloud_file(%{field: value})
      {:ok, %CloudFile{}}

      iex> create_cloud_file(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cloud_file(attrs \\ %{}) do
    %CloudFile{}
    |> CloudFile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cloud_file.

  ## Examples

      iex> update_cloud_file(cloud_file, %{field: new_value})
      {:ok, %CloudFile{}}

      iex> update_cloud_file(cloud_file, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cloud_file(%CloudFile{} = cloud_file, attrs) do
    cloud_file
    |> CloudFile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cloud_file.

  ## Examples

      iex> delete_cloud_file(cloud_file)
      {:ok, %CloudFile{}}

      iex> delete_cloud_file(cloud_file)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cloud_file(%CloudFile{} = cloud_file) do
    Repo.delete(cloud_file)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cloud_file changes.

  ## Examples

      iex> change_cloud_file(cloud_file)
      %Ecto.Changeset{data: %CloudFile{}}

  """
  def change_cloud_file(%CloudFile{} = cloud_file, attrs \\ %{}) do
    CloudFile.changeset(cloud_file, attrs)
  end
end
