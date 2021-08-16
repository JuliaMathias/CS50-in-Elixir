defmodule CS50.Pset1.Credit do
  @moduledoc """
  A program that checks wether a credit card is valid or not.

  # Implementation Details:

  - program prompts user for a card and then reports  whether it is a valid American Express, MasterCard, or Visa card number.
  - you can assume the inputs will be numeric

  ## Providers details

  - Amex:  15-digit numbers, starts with 34 or 37
  - Mastercard: 16-digit numbers, starts with 51, 52, 53, 54, or 55
  - Visa: 13- and 16-digit numbers, starts with 4
  """

  def check_card do
    #   # get the number
    #   # convert it to integer
    cc_number = IO.gets("Number: ") |> String.trim()

    # validate whether it has one of the approved lengths, return invalid otherwise
    with {:ok, length} <- validate_length(cc_number),
         # check provider by looking at the length + the approved starts, return invalid if there is an incongruity
         {:ok, provider} <- validate_provider(cc_number, length),
         # validate the checksum
         do: checksum(cc_number, provider)
  end

  def validate_length(cc_number) do
    length = String.length(cc_number)

    case length do
      13 -> {:ok, length}
      15 -> {:ok, length}
      16 -> {:ok, length}
      _ -> "INVALID"
    end
  end

  def validate_provider(cc_number, provider) do
    cc_number + provider
  end

  defp checksum(cc_number, provider) do
    # Multiply every other digit by 2, starting with the number’s second-to-last digit, and then add those products’ digits together.
    # Add the sum to the sum of the digits that weren’t multiplied by 2.
    # If the total’s last digit is 0 (or, put more formally, if the total modulo 10 is congruent to 0), the number is valid!
    cc_number + provider
  end
end
