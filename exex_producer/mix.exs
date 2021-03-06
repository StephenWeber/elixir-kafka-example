defmodule ExexProducer.MixProject do
  use Mix.Project

  def project do
    [
      app: :exex_producer,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :kaffe],
      mod: {ExexProducer.Application, []}
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.2"},
      {:yahoo_finance_elixir, "~> 0.1.3"},
      {:kaffe, "~> 1.0"}
    ]
  end
end
