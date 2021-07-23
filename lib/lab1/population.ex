defmodule CS50.Lab1.Population do
  @moduledoc """
  A simple program that gets a name from the user and then greets them with that name.
  """

  @spec interface :: String.t()
  def interface do
    start_size = IO.gets("Start size: ") |> String.to_float()
    start_size = validate_start_size(start_size)
    end_size = IO.gets("End size: ") |> String.to_float()
    end_size = validate_end_size(start_size, end_size)
    calculate(start_size, end_size)
  end

  def calculate(start_size, end_size, year_count \\ 0) do
    if start_size < end_size do
      IO.puts("starting a year")
      IO.inspect(start_size)
      IO.inspect(end_size)
      IO.inspect(year_count)
      new_start_size = yearly_change(start_size)
      new_year_count = year_count + 1
      IO.puts("new values")
      IO.inspect(new_start_size)
      IO.inspect(end_size)
      IO.inspect(new_year_count)
      calculate(new_start_size, end_size, new_year_count)
    else
      IO.puts("should just return year")
      IO.inspect(year_count)
      year_count
    end
  end

  defp validate_start_size(start_size) when start_size < 9 do
    new_size = IO.gets("Start size: ") |> String.to_float()
    validate_start_size(new_size)
  end

  defp validate_start_size(start_size), do: start_size |> String.to_float()

  defp validate_end_size(start_size, end_size) when start_size > end_size do
    new_size = IO.gets("End size: ") |> String.to_float()
    validate_end_size(start_size, new_size)
  end

  defp validate_end_size(_start_size, end_size), do: end_size |> String.to_float()

  defp yearly_change(start_size) do
    start_size + start_size / 3 - start_size / 4
  end
end
