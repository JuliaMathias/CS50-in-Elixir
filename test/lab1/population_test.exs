defmodule CS50.Lab1.PopulationTest do
  @moduledoc false

  use ExUnit.Case

  alias CS50.Lab1.Population

  describe "calculate/2" do
    test "when given start size 1200 and end size 1300, should return 1" do
      assert Population.calculate(1200, 1300) == 1
    end

    test "when given start size 9 and end size 18, should return 8" do
      assert Population.calculate(9, 18) == 8
    end
  end
end
