defmodule ExexProducer.Worker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(state) do
    schedule_stock_fetch()
    {:ok, state}
  end

  def handle_info(:stock_fetch, state) do
    info = stock_info("FB")
    bid = info["bid"]
    ask = info["ask"]
    rmp = info["regularMarketPrice"]
    IO.inspect("Current value FB: $#{rmp} -- $#{ask} $#{bid}")
    schedule_stock_fetch()
    s = Map.put(state, :bid, bid)
    s = Map.put(state, :ask, ask)
    {:noreply, s}
  end

  defp stock_info(symbol) do
    YahooFinance.custom_quote(symbol, [:regularMarketPrice, :bid, :ask])
    |> elem(1)
    |> elem(1)
    |> Jason.decode!()
    |> Map.get("quoteResponse")
    |> Map.get("result")
    |> hd
  end

  def schedule_stock_fetch do
    Process.send_after(self(), :stock_fetch, 5_000)
  end
end
