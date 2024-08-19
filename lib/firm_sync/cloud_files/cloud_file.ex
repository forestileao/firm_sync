defmodule FirmSync.CloudFiles.CloudFile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cloud_files" do
    field :size, :integer
    field :key, :string
    field :bucket_name, :string
    field :bucket_base_url, :string
    field :mime_type, :string

    timestamps()
  end

  @doc false
  def changeset(cloud_file, attrs) do
    cloud_file
    |> cast(attrs, [:key, :bucket_name, :bucket_base_url, :mime_type, :size])
    |> validate_required([:key, :bucket_name, :bucket_base_url, :mime_type, :size])
  end
end
