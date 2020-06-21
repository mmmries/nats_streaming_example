# NatsStreamingExample

This is a sample of how to use the [nats_streaming]() library.

The first step is to the add `{:nats_streaming, "0.0.2"}` to your `mix.exs` deps.

Then in your supervision tree you'll need to have:
* A supervised `Gnat` connection
* A `Nats.Streaming.Client`
* A `Nats.Streaming.Subscription`

Examples of all of these can be found in the `lib/nats_streaming_example/application.ex` file in this project.

Finally you need to publish some messages.
You can do this by starting the application and then using `Nats.Streaming.Client.pub` like this:

```
$ iex -S mix
15:05:13.212 [info]  connecting to %{host: '127.0.0.1', port: 4222}
Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Nats.Streaming.Client.pub(:streaming_client, "topic1", "Hello, World")
```

Because you have a subscription setup for `topic1` you should see a log message about your application receiving that message.
From there you can customize how you want to handle and acknowledge your messages by changing the subscription you are supervising to call whatever function you like.
