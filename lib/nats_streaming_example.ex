defmodule NatsStreamingExample do
  require Logger
  def message(message) do
    Logger.info("#{__MODULE__} Received: #{inspect(message)}")
    Nats.Streaming.Message.ack(message)
  end
end
