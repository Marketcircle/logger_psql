defmodule LoggerPSQL.Log do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @schema_prefix Application.compile_env(:logger_psql, [:backend, :prefix], "public")

  schema "logs" do
    field(:customer_id, :integer)
    field(:level, :string)
    field(:application, :string)
    field(:domain, :string)
    field(:file, :string)
    field(:function, :string)
    field(:line, :string)
    field(:module, :string)
    field(:pid, :string)
    field(:time, :utc_datetime)
    field(:user_email, :string)
    field(:user_id, :integer)
    field(:device_id, :string)
    field(:device_name, :string)
    field(:marketing_version, :string)
    field(:build_number, :string)
    field(:system_version, :string)

    field(:message, :string)
    field(:metadata, :map)
    field(:request_id, :string)

    timestamps()
  end

  def changeset(log \\ %__MODULE__{}, params) do
    log
    |> cast(params, [
      :customer_id,
      :level,
      :application,
      :domain,
      :file,
      :function,
      :line,
      :module,
      :pid,
      :time,
      :user_email,
      :user_id,
      :device_id,
      :device_name,
      :marketing_version,
      :build_number,
      :system_version,
      :metadata,
      :message,
      :request_id
    ])
  end
end
