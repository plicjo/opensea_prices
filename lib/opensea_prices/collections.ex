defmodule OpenseaPrices.Collections do

  alias OpenseaPrices.Apiclient

  def get_collections_info(), do: get_collections(get_assets())

  def get_assets() do
    {:ok, %Tesla.Env{body: %{"assets" => assets}}} = Apiclient.get_request_assets()
    assets
  end

  def get_collections(assets) do
    Enum.map(assets, fn %{"asset_contract" => asset_contract, "token_id" => token_id} ->
      {:ok, %Tesla.Env{body: %{"collection" => collection}}} = Apiclient.get_request_asset(%{token_id: token_id, contract_address: asset_contract["address"]})
      Map.put(Map.new(), :name, collection["name"])
      |> Map.put(:floor_price, collection["stats"]["floor_price"])
      |> Map.put(:one_day_volume, collection["stats"]["seven_day_volume"])
    end)
  end
end
