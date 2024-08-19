defmodule FirmSync.Repo.Migrations.CreateFirmwareUpdateRequests do
  use Ecto.Migration

  def change do
    create table(:firmware_update_requests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :string

      timestamps()
    end
  end
end
