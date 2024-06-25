defmodule WebcamConference.Repo do
  use Ecto.Repo,
    otp_app: :webcam_conference,
    adapter: Ecto.Adapters.Postgres
end
