defmodule CS50.Pset1.Mario do
  @moduledoc """
  A program that prints a piramid based on a height input from the user.
  """

  def make_piramid do
    {height, _} = IO.gets("Height: ") |> Integer.parse()
    {height, _} = {validate_height(height), ""}
    print_piramid(height, 0)
  end

  defp validate_height(height) when height < 0 or height > 9 do
    {new_height, _} = IO.gets("Height: ") |> Integer.parse()
    validate_height(new_height)
  end

  defp validate_height(height), do: height

  defp print_piramid(original_height, i) when i == original_height - 1 do
    draw("#", i + 1)
    draw(" ", 2)
    draw("#", i + 1)
    draw("\n", 1)
  end

  defp print_piramid(original_height, i) do
    draw(" ", original_height - 1 - i)
    draw("#", i + 1)
    draw(" ", 2)
    draw("#", i + 1)
    draw("\n", 1)
    print_piramid(original_height, i + 1)
  end

  def draw(character, times) when times > 1 do
    IO.write(character)
    draw(character, times - 1)
  end

  def draw(character, 1) do
    IO.write(character)
  end
end
