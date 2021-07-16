defmodule CS50Test do
  use ExUnit.Case
  doctest CS50

  test "greets the world" do
    assert CS50.hello() == :world
  end
end
