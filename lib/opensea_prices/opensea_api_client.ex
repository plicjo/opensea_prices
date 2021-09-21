defmodule OpenseaPrices.OpenseaApiClient do
  use Tesla

  plug Tesla.Middleware.JSON

  def get_collections(query_params \\ [limit: 300, offset: 0]) do
    {:ok, %Tesla.Env{body: %{"collections" => collections}}} = get("https://api.opensea.io/api/v1/collections", query: query_params)
    collections
  end
end
