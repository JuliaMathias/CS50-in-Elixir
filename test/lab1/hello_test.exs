defmodule CS50.Lab1.HelloTest do
  @moduledoc false

  use ExUnit.Case

  alias CS50.Lab1.Hello

  test "when given name, should say hello name" do
    assert Hello.greet("julia") == "hello julia"
  end
end
