defmodule ConsentWeb.Router do
  use ConsentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ConsentWeb do
    pipe_through :api
  end

  scope "/api", ConsentWeb do
    pipe_through :api
    post "/patients/:patient_id/consents/ask", ConsentController, :ask_consent
    post "/patients/:patient_id/consents/grant", ConsentController, :grant_consent
    post "/patients/:patient_id/consents/revoke", ConsentController, :revoke_consent

    get "/patients/:patient_id/consents", ConsentController, :list_consents
    get "/patients/:patient_id/consents/filter", ConsentController, :has_consent?
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ConsentWeb.Telemetry
    end
  end
end
