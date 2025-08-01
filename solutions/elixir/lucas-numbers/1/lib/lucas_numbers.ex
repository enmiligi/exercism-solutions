defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  def generate(1), do: [2]
  def generate(2), do: [2, 1]
  def generate(x) when not is_integer(x) or x < 1 do
    raise ArgumentError, "count must be specified as an integer >= 1"
  end
  def generate(x) do
    Enum.map(Enum.take(
      Stream.iterate({2, 1}, fn {n1, n2} -> {n2, n1 + n2} end),
      x), fn {n, _} -> n end)
  end
end
