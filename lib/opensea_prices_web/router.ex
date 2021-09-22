defmodule OpenseaPricesWeb.Router do
  use OpenseaPricesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    resources "/api/assets", OpenseaPricesWeb.AssetController, only: [:index]
  end

  scope "/", OpenseaPricesWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end
end
