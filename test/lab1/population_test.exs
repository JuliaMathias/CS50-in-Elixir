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

    test "when given start size 20 and end size 100, should return 20" do
      assert Population.calculate(20, 100) == 20
    end

    test "when given start size 100 and end size 1000000, should return 115" do
      assert Population.calculate(100, 1_000_000) == 115
    end
  end
end
