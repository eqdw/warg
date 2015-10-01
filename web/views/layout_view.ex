defmodule Warg.LayoutView do
  use Warg.Web, :view

  def main_menu_links do
    %{
      "Home"  => Warg.Router.Helpers.page_path(Warg.Endpoint, :index),
      "Ehlo"  => Warg.Router.Helpers.ehlo_path(Warg.Endpoint, :index),
      "Users" => Warg.Router.Helpers.user_path(Warg.Endpoint, :index)
    }
  end
end
