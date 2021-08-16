defmodule CS50.Pset1.CreditTest do
  @moduledoc false

  use ExUnit.Case

  alias CS50.Pset1.Credit

  describe "validate_length/1" do
    test "if credit card number has 13 digits it should return {:ok, 13}" do
      assert Credit.validate_length("1234567891234") == {:ok, 13}
    end

    test "if credit card number has 15 digits it should return {:ok, 15}" do
      assert Credit.validate_length("123456789123456") == {:ok, 15}
    end

    test "if credit card number has 16 digits it should return {:ok, 16}" do
      assert Credit.validate_length("1234567891234567") == {:ok, 16}
    end

    test "if credit card number has 14 digits it should INVALID" do
      assert Credit.validate_length("12345678912345") == "INVALID"
    end
  end
end
