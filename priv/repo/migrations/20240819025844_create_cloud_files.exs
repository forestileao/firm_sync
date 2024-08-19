defmodule FirmSync.Repo.Migrations.CreateCloudFiles do
  use Ecto.Migration

  def change do
    create table(:cloud_files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :key, :string
      add :bucket_name, :string
      add :bucket_base_url, :string
      add :mime_type, :string
      add :size, :integer

      timestamps()
    end
  end
end
