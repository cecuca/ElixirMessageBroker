defmodule GenServerBrokerTest do
  use ExUnit.Case
  doctest GenServerBroker

  test "greets the world" do
    assert GenServerBroker.hello() == :world
  end
end
