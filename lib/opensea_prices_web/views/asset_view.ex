defmodule OpenseaPricesWeb.AssetView do
  use OpenseaPricesWeb, :view

  def render("index.json", %{assets: assets}) do
    %{
      assets: Enum.map(assets, &asset_json/1)
    }
  end

  def asset_json(asset) do
    %{
      name: asset["name"],
      last_sale: asset["last_sale"]["payment_token"]["eth_price"]
    }
  end
end
