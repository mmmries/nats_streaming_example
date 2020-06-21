defmodule NatsStreamingExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      {Gnat.ConnectionSupervisor, gnat_settings()},
      worker(Nats.Streaming.Client, [[connection_name: :gnat], [name: :streaming_client]]),
      worker(Nats.Streaming.Subscription, [subscription_settings()])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NatsStreamingExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp gnat_settings do
    %{
      name: :gnat,
      connection_settings: [
        %{host: '127.0.0.1', port: 4222}
      ]
    } 
  end

  defp subscription_settings do
    [
      client_name: :streaming_client,
      subject: "topic1",
      consuming_function: {NatsStreamingExample, :message},
      start_position: :first
    ]
  end
end
