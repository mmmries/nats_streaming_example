defmodule NatsStreamingExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :nats_streaming_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NatsStreamingExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nats_streaming, "0.0.2"}
    ]
  end
end
