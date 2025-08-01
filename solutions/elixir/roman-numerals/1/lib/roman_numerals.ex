defmodule RomanNumerals do
  @numerals [
    [1000, "M"], [900, "CM"],
    [500, "D"], [400, "CD"],
    [100, "C"], [90, "XC"],
    [50, "L"], [40, "XL"],
    [10, "X"], [9, "IX"],
    [5, "V"], [4, "IV"],
    [1, "I"],
  ]

  def append_numeral([value, digit], [number, converted]) do
    [rem(number, value), converted <> String.duplicate(digit, div(number, value))]
  end
  
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    [_, converted] = List.foldl(@numerals, [number, ""], &append_numeral/2)
    converted
  end
end
