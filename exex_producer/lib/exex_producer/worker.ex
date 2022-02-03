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
    spread = String.to_integer(ask) - String.to_integer(bid)
    IO.inspect("Current value FB: $#{rmp} spread $#{spread} -- $#{ask} $#{bid}")
    schedule_stock_fetch()
    produce_data(rmp, spread)
    s = Map.put(state, :spread, spread)
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

  defp produce_data(price, spread) do
    Kaffe.Producer.produce_sync("price", [{"price", price}])
    Kaffe.Producer.produce_sync("spread", [{"spread", spread}])
  end
end
