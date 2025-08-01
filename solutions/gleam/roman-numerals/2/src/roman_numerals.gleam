import gleam/list
import gleam/string

pub fn convert(number: Int) {
  do_convert(number, "", [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1])
}

fn do_convert(number, roman_numerals, factors) {
  let [factor, ..factors] = factors
  case factor <= number {
    True -> {
      let multiplier = number / factor
      let roman_numeral =
        list.repeat(decimal_to_roman_numeral(factor), multiplier)
      let roman_numerals = string.concat([roman_numerals, ..roman_numeral])
      let number = number - factor * multiplier
      case number {
        0 -> roman_numerals
        _ -> do_convert(number, roman_numerals, factors)
      }
    }
    False -> do_convert(number, roman_numerals, factors)
  }
}

fn decimal_to_roman_numeral(decimal) {
  case decimal {
    1 -> "I"
    4 -> "IV"
    5 -> "V"
    9 -> "IX"
    10 -> "X"
    40 -> "XL"
    50 -> "L"
    90 -> "XC"
    100 -> "C"
    400 -> "CD"
    500 -> "D"
    900 -> "CM"
    1000 -> "M"
  }
}
