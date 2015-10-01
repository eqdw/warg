defmodule Warg.RegistrationController do
  use Warg.Web, :controller

  alias Warg.User
  alias Passport.RegistrationManager

  def new(conn, _params) do
    user = User.changeset(%User{})
    conn
    |> render("new.html", user: user)
  end

  def create(conn, %{"registration" => registration_params}) do
    case RegistrationManager.register(registration_params) do
      {:ok, changeset} ->
        conn
          |> put_flash(:info, "Registration success")
          |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        conn
          |> render("new.html", user: changeset)
    end
  end
end
