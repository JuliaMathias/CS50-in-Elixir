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

    test "if credit card number has 14 digits it should return INVALID" do
      assert Credit.validate_length("12345678912345") == "INVALID"
    end
  end

  describe "validate_provider/2" do
    test "if credit card number has 15 digits and starts with 34 or 37, should return {:ok, Amex}" do
      assert Credit.validate_provider("343456789123456", 15) == {:ok, "Amex"}
      assert Credit.validate_provider("373456789123456", 15) == {:ok, "Amex"}
    end

    test "if credit card number has 15 digits but doesn't start with 34 or 37, should return INVALID" do
      assert Credit.validate_provider("123456789123456", 15) == "INVALID"
    end

    test "if credit card number has 13 digits and starts with 4, should return {:ok, Visa}" do
      assert Credit.validate_provider("4345678912345", 13) == {:ok, "Visa"}
    end

    test "if credit card number has 13 digits but doesn't start with 4, should return INVALID" do
      assert Credit.validate_provider("1234567891234", 13) == "INVALID"
    end

    test "if credit card number has 16 digits and starts with 4, should return {:ok, Visa}" do
      assert Credit.validate_provider("4343456789123456", 16) == {:ok, "Visa"}
    end

    test "if credit card number has 16 digits and starts with 51, 52, 53, 54, or 55, should return {:ok, Mastercard}" do
      assert Credit.validate_provider("5143456789123456", 16) == {:ok, "Mastercard"}
      assert Credit.validate_provider("5273456789123456", 16) == {:ok, "Mastercard"}
      assert Credit.validate_provider("5373456789123456", 16) == {:ok, "Mastercard"}
      assert Credit.validate_provider("5473456789123456", 16) == {:ok, "Mastercard"}
      assert Credit.validate_provider("5573456789123456", 16) == {:ok, "Mastercard"}
    end

    test "if credit card number has 16 digits but doesn't start with 4, 51, 52, 53, 54, or 55, should return INVALID" do
      assert Credit.validate_provider("6123456789123456", 16) == "INVALID"
    end
  end
end
