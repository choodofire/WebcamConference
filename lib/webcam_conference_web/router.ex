defmodule WebcamConferenceWeb.Router do
  use WebcamConferenceWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WebcamConferenceWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebcamConferenceWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/api", WebcamConferenceWeb do
    pipe_through :api

  end

  import Phoenix.LiveDashboard.Router
  scope "/dev" do
    pipe_through :browser

    live_dashboard "/dashboard", metrics: WebcamConferenceWeb.Telemetry
  end
end
