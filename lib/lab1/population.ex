defmodule CS50.Lab1.Population do
  @moduledoc """
  A simple program that gets a name from the user and then greets them with that name.
  """

  @spec interface :: String.t()
  def interface do
    {start_size, _} = IO.gets("Start size: ") |> Integer.parse()
    {start_size, _} = {validate_start_size(start_size), ""}
    {end_size, _} = IO.gets("End size: ") |> Integer.parse()
    {end_size, _} = {validate_end_size(start_size, end_size), ""}
    calculate(start_size, end_size)
  end

  @spec calculate(pos_integer, pos_integer, pos_integer) :: any
  def calculate(start_size, end_size, year_count \\ 0) do
    if start_size < end_size do
      new_start_size = yearly_change(start_size)
      new_year_count = year_count + 1
      calculate(new_start_size, end_size, new_year_count)
    else
      year_count
    end
  end

  defp validate_start_size(start_size) when start_size < 9 do
    {new_size, _} = IO.gets("Start size: ") |> Integer.parse()
    validate_start_size(new_size)
  end

  defp validate_start_size(start_size), do: start_size

  defp validate_end_size(start_size, end_size) when start_size > end_size do
    {new_size, _} = IO.gets("End size: ") |> Integer.parse()
    validate_end_size(start_size, new_size)
  end

  defp validate_end_size(_start_size, end_size), do: end_size

  defp yearly_change(start_size) do
    births = (start_size / 3) |> Kernel.trunc()
    deaths = (start_size / 4) |> Kernel.trunc()

    start_size + births - deaths
  end
end
