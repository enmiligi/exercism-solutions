defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @all_letters MapSet.new("abcdefghijklmnopqrstuvwxyz" |> String.to_charlist())

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.replace(~r/[^a-zA-Z]/, "")
    |> String.downcase()
    |> String.to_charlist()
    |> MapSet.new() == @all_letters
  end
end
