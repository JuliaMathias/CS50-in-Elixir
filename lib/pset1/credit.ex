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

  @spec check_card :: binary
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

  @spec validate_length(String.t()) :: <<_::56>> | {:ok, 13 | 15 | 16}
  def validate_length(cc_number) do
    length = String.length(cc_number)

    case length do
      13 -> {:ok, length}
      15 -> {:ok, length}
      16 -> {:ok, length}
      _ -> "INVALID"
    end
  end

  @spec validate_provider(String.t(), number) :: <<_::56>> | {:ok, String.t()}
  def validate_provider(<<start::binary-size(1), _rest::binary-size(12)>>, 13) do
    case start do
      "4" -> {:ok, "Visa"}
      _ -> "INVALID"
    end
  end

  def validate_provider(<<start::binary-size(2), _rest::binary-size(13)>>, 15) do
    case start do
      "34" -> {:ok, "Amex"}
      "37" -> {:ok, "Amex"}
      _ -> "INVALID"
    end
  end

  def validate_provider(
        <<first_char::binary-size(1), second_char::binary-size(1), _rest::binary-size(14)>>,
        16
      ) do
    start = first_char <> second_char
    mastercard_starts = ["51", "52", "53", "54", "55"]

    cond do
      first_char == "4" -> {:ok, "Visa"}
      Enum.member?(mastercard_starts, start) -> {:ok, "Mastercard"}
      true -> "INVALID"
    end
  end

  @spec checksum(String.t(), String.t()) :: String.t()
  def checksum(cc_number, provider) do
    list_of_digits = get_reversed_digits(cc_number)
    # IO.inspect(list_of_digits, label: "reversed list")

    sum_1 = add_every_other_number(list_of_digits)
    # IO.inspect(sum_1, label: "sum_1")

    sum_2 = add_remaining_digits(list_of_digits)
    # IO.inspect(sum_2, label: "sum_2")

    last_digit = (sum_1 + sum_2) |> Integer.digits() |> List.last()
    # IO.inspect(last_digit, label: "last_digit")

    case last_digit do
      0 -> provider
      _ -> "INVALID"
    end
  end

  @spec get_reversed_digits(String.t()) :: list()
  defp get_reversed_digits(cc_number) do
    cc_number
    |> Integer.parse()
    |> Kernel.elem(0)
    |> Integer.digits()
    |> Enum.reverse()
  end

  defp add_every_other_number(list_of_digits) do
    list_of_digits
    |> Enum.drop_every(2)
    |> Enum.map(fn x -> x * 2 end)
    |> Enum.map(fn x -> Integer.digits(x) end)
    |> List.flatten()
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  defp add_remaining_digits(list_of_digits) do
    list_of_digits
    |> List.insert_at(0, 0)
    |> Enum.drop_every(2)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end
end
