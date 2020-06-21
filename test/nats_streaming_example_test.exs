defmodule NatsStreamingExampleTest do
  use ExUnit.Case
  doctest NatsStreamingExample

  test "greets the world" do
    assert NatsStreamingExample.hello() == :world
  end
end
