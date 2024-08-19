defmodule FirmSync.FirmwareUpdateRequests do
  @moduledoc """
  The FirmwareUpdateRequests context.
  """

  import Ecto.Query, warn: false
  alias FirmSync.Repo

  alias FirmSync.FirmwareUpdateRequests.FirmwareUpdateRequest

  @doc """
  Returns the list of firmware_update_requests.

  ## Examples

      iex> list_firmware_update_requests()
      [%FirmwareUpdateRequest{}, ...]

  """
  def list_firmware_update_requests do
    Repo.all(FirmwareUpdateRequest)
  end

  @doc """
  Gets a single firmware_update_request.

  Raises `Ecto.NoResultsError` if the Firmware update request does not exist.

  ## Examples

      iex> get_firmware_update_request!(123)
      %FirmwareUpdateRequest{}

      iex> get_firmware_update_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_firmware_update_request!(id), do: Repo.get!(FirmwareUpdateRequest, id)

  @doc """
  Creates a firmware_update_request.

  ## Examples

      iex> create_firmware_update_request(%{field: value})
      {:ok, %FirmwareUpdateRequest{}}

      iex> create_firmware_update_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_firmware_update_request(attrs \\ %{}) do
    %FirmwareUpdateRequest{}
    |> FirmwareUpdateRequest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a firmware_update_request.

  ## Examples

      iex> update_firmware_update_request(firmware_update_request, %{field: new_value})
      {:ok, %FirmwareUpdateRequest{}}

      iex> update_firmware_update_request(firmware_update_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_firmware_update_request(%FirmwareUpdateRequest{} = firmware_update_request, attrs) do
    firmware_update_request
    |> FirmwareUpdateRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a firmware_update_request.

  ## Examples

      iex> delete_firmware_update_request(firmware_update_request)
      {:ok, %FirmwareUpdateRequest{}}

      iex> delete_firmware_update_request(firmware_update_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_firmware_update_request(%FirmwareUpdateRequest{} = firmware_update_request) do
    Repo.delete(firmware_update_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking firmware_update_request changes.

  ## Examples

      iex> change_firmware_update_request(firmware_update_request)
      %Ecto.Changeset{data: %FirmwareUpdateRequest{}}

  """
  def change_firmware_update_request(%FirmwareUpdateRequest{} = firmware_update_request, attrs \\ %{}) do
    FirmwareUpdateRequest.changeset(firmware_update_request, attrs)
  end
end
