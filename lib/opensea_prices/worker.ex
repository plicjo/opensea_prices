defmodule OpenseaPrices.Worker do
  use GenServer
  @name :worker

  alias OpenseaPrices.OpenseaApiClient

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  def list_assets() do
    GenServer.call(@name, :list_assets)
  end

  @impl true
  def init(_state) do
    schedule_work()
    {:ok, OpenseaApiClient.get_assets()}
  end

  @impl true
  def handle_info(:get_assets, _state) do
    schedule_work()
    {:noreply, OpenseaApiClient.get_assets()}
  end

  @impl true
  def handle_call(:list_assets, _from, state) do
    {:reply, state, state}
  end

  defp schedule_work do
    Process.send_after(self(), :get_assets, 10_000)
  end
end
