defmodule OpenseaPricesWeb.AssetController do
  use OpenseaPricesWeb, :controller

  alias OpenseaPrices.Worker

  def index(conn, _params) do
    render conn, "index.json", assets: Worker.list_assets()
  end
end
