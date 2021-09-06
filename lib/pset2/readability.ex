defmodule CS50.Pset2.Readability do
  @moduledoc """

  index = 0.0588 * L - 0.296 * S - 15.8

  Here, L is the average number of letters per 100 words in the text, and S is the average number of sentences per 100 words in the text.

  Design and implement a program, readability, that computes the Coleman-Liau index of the text.

  Your program must prompt the user for a string of text (using get_string).

  Your program should count the number of letters, words, and sentences in the text. You may assume that a letter is any lowercase character from a to z or any uppercase character from A to Z, any sequence of characters separated by spaces should count as a word, and that any occurrence of a period, exclamation point, or question mark indicates the end of a sentence.

  Your program should print as output "Grade X" where X is the grade level computed by the Coleman-Liau formula, rounded to the nearest integer.

  If the resulting index number is 16 or higher (equivalent to or greater than a senior undergraduate reading level), your program should output "Grade 16+" instead of giving the exact index number. If the index number is less than 1, your program should output "Before Grade 1".

  """

  @spec check_reading_level :: binary
  def check_reading_level do
    text = IO.gets("Text: ")

    average = calculate_average(text)

    case average do
      average when average < 1 -> "Before Grade 1"
      average when average < 16 -> "Grade #{average}"
      _ -> "Grade 16+"
    end
  end

  @spec count_letters(binary) :: non_neg_integer
  def count_letters(text) do
    text
    |> remove_punctuation()
    |> String.replace(" ", "")
    |> String.length()
  end

  @spec count_words(binary) :: non_neg_integer
  def count_words(text) do
    text
    |> remove_punctuation()
    |> String.split()
    |> Enum.count()
  end

  @spec count_sentences(binary) :: non_neg_integer
  def count_sentences(text) do
    text
    |> String.replace("...", ".")
    |> String.replace("!", ".")
    |> String.replace("?", ".")
    |> String.split(".")
    |> Enum.count()
  end

  @spec calculate_average(binary) :: integer
  def calculate_average(text) do
    average_number_of_letters = count_letters(text) / count_words(text) * 100
    average_number_of_sentences = count_sentences(text) / count_words(text) * 100

    (0.0588 * average_number_of_letters - 0.296 * average_number_of_sentences - 15.8)
    |> Kernel.round()
  end

  defp remove_punctuation(text) do
    text
    |> String.replace(".", "")
    |> String.replace(",", "")
    |> String.replace("!", "")
    |> String.replace("?", "")
    |> String.replace("'", "")
  end
end
