defmodule CS50.Lab1.Hello do
  @moduledoc """
  A simple program that gets a name from the user and then greets them with that name.
  """

  @spec greet :: String.t()
  def greet do
    name = IO.gets("What is your name? ")
    "hello #{name}"
  end
end
