defmodule CS50.Lab1.Hello do
  @moduledoc """
  A simple program that gets a name from the user and then greets them with that name.
  """

  @spec greet(name :: String.t()) :: String.t()
  def greet(name) do
    "hello #{name}"
  end
end
