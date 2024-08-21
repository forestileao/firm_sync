defmodule FirmSync.Repo.Migrations.AddBasicRelationships do
  use Ecto.Migration

  def change do
    alter table(:firmware_update_requests) do
      add :board_id, references(:boards, type: :binary_id, on_delete: :nothing), null: false
      add :firmware_version_id, references(:firmware_versions, type: :binary_id, on_delete: :nothing), null: false
    end

    alter table(:firmware_versions) do
      add :firmware_id, references(:firmwares, type: :binary_id, on_delete: :nothing), null: false
      add :cloud_file_id, references(:cloud_files, type: :binary_id, on_delete: :nothing), null: false
    end
  end
end
