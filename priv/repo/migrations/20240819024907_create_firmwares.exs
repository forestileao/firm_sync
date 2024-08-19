defmodule FirmSync.Repo.Migrations.CreateFirmwares do
  use Ecto.Migration

  def change do
    create table(:firmwares, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
