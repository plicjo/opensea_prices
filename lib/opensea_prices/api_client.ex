defmodule OpenseaPrices.Apiclient do
  use Tesla

  plug Tesla.Middleware.JSON

  def get_request_assets() do
    get("https://api.opensea.io/api/v1/assets", query: query_params_get_assets())
  end

  defp query_params_get_assets() do
    [
      order_by: "sale_count",
      order_direction: "desc",
      limit: "10",
    ]
  end

  def get_request_asset(params) do
    get("https://api.opensea.io/api/v1/asset/" <> params.contract_address <> "/" <> params.token_id <> "/")
  end
end
