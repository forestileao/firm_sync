defmodule FirmSync.Repo.Migrations.CreateReleases do
  use Ecto.Migration

  def change do
    create table(:releases, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :date, :date

      timestamps()
    end
  end
end
