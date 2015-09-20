defmodule Warg.SessionController do
  use Warg.Web, :controller
  alias Passport.SessionManager
  alias Warg.User

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case SessionManager.login(conn, session_params) do
      {:ok, conn, user} ->
        conn
        |> put_flash(:info, "Login successful.")
        |> redirect(to: page_path(conn, :index))
      {:error, conn} ->
        conn
        |> put_flash(:error, "Email or password incorrect.")
        |> render(:new)
    end
  end

  def delete(conn, _params) do
    SessionManager.logout(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: page_path(conn, :index))
  end

end

