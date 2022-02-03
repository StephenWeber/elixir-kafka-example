defmodule ExexPriceConsumer do
  @moduledoc """
  Documentation for `ExexPriceConsumer`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExexPriceConsumer.hello()
      :world

  """
  def handle_message(%{key: key, value: value} = message) do
    IO.inspect(message)
    IO.puts("Price message received: #{key}: #{value}")
    :ok
  end
end
