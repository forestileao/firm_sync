defmodule FirmSync.Repo.Migrations.CreateFirmwareVersions do
  use Ecto.Migration

  def change do
    create table(:firmware_versions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :version, :string

      timestamps()
    end
  end
end
