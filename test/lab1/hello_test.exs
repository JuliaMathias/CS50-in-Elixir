defmodule CS50.Lab1.HelloTest do
  @moduledoc false

  use ExUnit.Case

  alias CS50.Lab1.Hello

  test "when given name julia, should say hello julia" do
    assert Hello.greet() == "hello julia\n"
  end
end
