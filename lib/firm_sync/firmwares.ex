defmodule FirmSync.Firmwares do
  @moduledoc """
  The Firmwares context.
  """

  import Ecto.Query, warn: false
  alias FirmSync.Repo

  alias FirmSync.Firmwares.Firmware

  @doc """
  Returns the list of firmwares.

  ## Examples

      iex> list_firmwares()
      [%Firmware{}, ...]

  """
  def list_firmwares do
    Repo.all(Firmware)
  end

  @doc """
  Gets a single firmware.

  Raises `Ecto.NoResultsError` if the Firmware does not exist.

  ## Examples

      iex> get_firmware!(123)
      %Firmware{}

      iex> get_firmware!(456)
      ** (Ecto.NoResultsError)

  """
  def get_firmware!(id), do: Repo.get!(Firmware, id)

  @doc """
  Creates a firmware.

  ## Examples

      iex> create_firmware(%{field: value})
      {:ok, %Firmware{}}

      iex> create_firmware(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_firmware(attrs \\ %{}) do
    %Firmware{}
    |> Firmware.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a firmware.

  ## Examples

      iex> update_firmware(firmware, %{field: new_value})
      {:ok, %Firmware{}}

      iex> update_firmware(firmware, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_firmware(%Firmware{} = firmware, attrs) do
    firmware
    |> Firmware.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a firmware.

  ## Examples

      iex> delete_firmware(firmware)
      {:ok, %Firmware{}}

      iex> delete_firmware(firmware)
      {:error, %Ecto.Changeset{}}

  """
  def delete_firmware(%Firmware{} = firmware) do
    Repo.delete(firmware)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking firmware changes.

  ## Examples

      iex> change_firmware(firmware)
      %Ecto.Changeset{data: %Firmware{}}

  """
  def change_firmware(%Firmware{} = firmware, attrs \\ %{}) do
    Firmware.changeset(firmware, attrs)
  end

  alias FirmSync.Firmwares.FirmwareVersion

  @doc """
  Returns the list of firmware_versions.

  ## Examples

      iex> list_firmware_versions()
      [%FirmwareVersion{}, ...]

  """
  def list_firmware_versions do
    Repo.all(FirmwareVersion)
  end

  @doc """
  Gets a single firmware_version.

  Raises `Ecto.NoResultsError` if the Firmware version does not exist.

  ## Examples

      iex> get_firmware_version!(123)
      %FirmwareVersion{}

      iex> get_firmware_version!(456)
      ** (Ecto.NoResultsError)

  """
  def get_firmware_version!(id), do: Repo.get!(FirmwareVersion, id)

  @doc """
  Creates a firmware_version.

  ## Examples

      iex> create_firmware_version(%{field: value})
      {:ok, %FirmwareVersion{}}

      iex> create_firmware_version(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_firmware_version(attrs \\ %{}) do
    %FirmwareVersion{}
    |> FirmwareVersion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a firmware_version.

  ## Examples

      iex> update_firmware_version(firmware_version, %{field: new_value})
      {:ok, %FirmwareVersion{}}

      iex> update_firmware_version(firmware_version, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_firmware_version(%FirmwareVersion{} = firmware_version, attrs) do
    firmware_version
    |> FirmwareVersion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a firmware_version.

  ## Examples

      iex> delete_firmware_version(firmware_version)
      {:ok, %FirmwareVersion{}}

      iex> delete_firmware_version(firmware_version)
      {:error, %Ecto.Changeset{}}

  """
  def delete_firmware_version(%FirmwareVersion{} = firmware_version) do
    Repo.delete(firmware_version)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking firmware_version changes.

  ## Examples

      iex> change_firmware_version(firmware_version)
      %Ecto.Changeset{data: %FirmwareVersion{}}

  """
  def change_firmware_version(%FirmwareVersion{} = firmware_version, attrs \\ %{}) do
    FirmwareVersion.changeset(firmware_version, attrs)
  end
end
