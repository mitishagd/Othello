defmodule OthelloWeb.Router do
  use OthelloWeb, :router

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

  scope "/", OthelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/games/:game_name/:player_name", PageController, :game
    get "/table/:player_name", PageController, :table
  end

  # Other scopes may use custom stacks.
  # scope "/api", OthelloWeb do
  #   pipe_through :api
  # end
end