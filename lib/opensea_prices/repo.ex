defmodule OpenseaPrices.Repo do
  use Ecto.Repo,
    otp_app: :opensea_prices,
    adapter: Ecto.Adapters.Postgres
end
