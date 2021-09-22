defmodule OpenseaPrices.OpenseaApiClient do
  use Tesla

  plug Tesla.Middleware.JSON

  def get_collections(query_params \\ [limit: 300, offset: 0]) do
    {:ok, %Tesla.Env{body: %{"collections" => collections}}} = get("https://api.opensea.io/api/v1/collections", query: query_params)
    Enum.map(collections, fn collection -> collection["name"] end)
  end

  # Sale price returns a 500
  def get_assets(query_params \\ [limit: 10, order_by: "sale_count", order_direction: "desc"]) do
    {:ok, %Tesla.Env{body: %{"assets" => assets}}} = get("https://api.opensea.io/api/v1/assets", query: query_params)
    assets
  end
end
