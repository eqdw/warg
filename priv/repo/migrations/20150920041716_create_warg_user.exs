defmodule Warg.Repo.Migrations.CreateWarg.User do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :crypted_password, :string

      timestamps
    end

  end
end
