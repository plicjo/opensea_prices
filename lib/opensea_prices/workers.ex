defmodule OpenseaPrices.Workers do
  use GenServer

  alias OpenseaPrices.Collections

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:get_collections, _state) do
    schedule_work()
    {:noreply, Collections.get_collections_info()}
  end

  defp schedule_work do
    Process.send_after(self(), :get_collections, 10000)
  end
end
