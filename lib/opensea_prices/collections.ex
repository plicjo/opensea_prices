defmodule OpenseaPrices.Collections do
  alias OpenseaPrices.OpenseaApiClient
  @limit 300
  @initial_offset 0

  def list_collections() do
    results = OpenseaApiClient.get_collections([limit: @limit, offset: @initial_offset])
    list_collections(results, @initial_offset + 300, Enum.count(results))
  end

  def list_collections(list, offset, last_result_count = 300) do
    results = OpenseaApiClient.get_collections([limit: @limit, offset: offset])
    list_collections(list ++ results, offset + 300, Enum.count(results))
  end

  # API limits results at 50_000 offset
  def list_collections(list, 47_700, last_result_count) do
    list
  end
end
