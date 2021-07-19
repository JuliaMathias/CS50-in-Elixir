defmodule CS50.Lab1.Population do
  @moduledoc """
  A simple program that gets a name from the user and then greets them with that name.
  """

  @spec calculate :: String.t()
  def calculate do
    start_size = IO.gets("Start size: ") |> String.to_integer()
    start_size = validate_start_size(start_size)
    end_size = IO.gets("End size: ") |> String.to_integer()
    end_size = validate_end_size(start_size, end_size)
    yearly_change = start_size + start_size / 3 - start_size / 4

    calculate_years(end_size, yearly_change)
    |> Float.ceil()
    |> Kernel.trunc()
  end

  defp validate_start_size(start_size) when start_size < 9 do
    new_size = IO.gets("Start size: ") |> String.to_integer()
    validate_start_size(new_size)
  end

  defp validate_start_size(start_size), do: start_size |> String.to_integer()

  defp validate_end_size(start_size, end_size) when start_size > end_size do
    new_size = IO.gets("End size: ") |> String.to_integer()
    validate_end_size(start_size, new_size)
  end

  defp validate_end_size(_start_size, end_size), do: end_size |> String.to_integer()

  defp calculate_years(end_size, yearly_change), do: end_size / yearly_change
end
