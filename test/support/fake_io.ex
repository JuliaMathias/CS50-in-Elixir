defmodule CS50.Support.FakeIO do
  @moduledoc """

  """

  def gets(word :: String.t()), do: IO.puts(word)
end
