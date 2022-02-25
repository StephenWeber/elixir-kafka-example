defmodule ExexPriceConsumer.MixProject do
  use Mix.Project

  def project do
    [
      app: :exex_price_consumer,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :kaffe],
      mod: {ExexPriceConsumer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:kaffe, "~> 1.0"}
    ]
  end
end
