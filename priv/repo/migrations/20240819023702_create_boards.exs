defmodule FirmSync.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :boardType, :string
      add :manufacturer, :string
      add :mac_address, :string

      timestamps()
    end
  end
end
