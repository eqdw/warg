defmodule Warg.EhloController do
  use Warg.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
