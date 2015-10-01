defmodule Warg.Router do
  use Warg.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Warg do
    pipe_through :browser # Use the default browser stack

    get "/",                PageController, :index
    get "/ehlo",            EhloController, :index
    get "/ehlo/:messenger", EhloController, :show

    resources "/users", UserController

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    get "/signup", RegistrationController, :new
    post "/signup", RegistrationController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Warg do
  #   pipe_through :api
  # end
end
