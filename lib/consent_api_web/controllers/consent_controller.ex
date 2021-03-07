defmodule ConsentWeb.ConsentController do
  use ConsentWeb, :controller

  # fallback actions: not discussed
  action_fallback ConsentWeb.FallbackController
  alias Consent.Api, as: ConsentApi

  @spec action(Plug.Conn, Map) :: Plug.Conn

  # Command side request
  def grant_consent(conn, %{
        "patient_id" => patient_id,
        "to_entity" => to_entity,
        "to_id" => to_id,
        "target" => target
      }) do
    with :ok <- ConsentApi.grant_consent(patient_id, to_entity, to_id, target) do
      conn
      |> put_status(:ok)
      |> json(%{patient_id: patient_id, action: :grant_consent})
    end
  end

  # Query side request
  def list_consents(conn, %{"patient_id" => patient_id}) do
    list = ConsentApi.consents(patient_id)
    conn
    |> put_status(:ok)
    |> json(%{data: list})
  end
end