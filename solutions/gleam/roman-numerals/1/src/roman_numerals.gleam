import gleam/list.{find}
import gleam/result.{unwrap}

const numerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

pub fn convert(number: Int) -> String {
  helper(number, "")
}

fn helper(number: Int, acc: String) {
  case unwrap(find(numerals, fn(numeral) { number >= numeral }), 0) {
    1000 -> helper(number - 1000, acc <> "M")
    900 -> helper(number - 900, acc <> "CM")
    500 -> helper(number - 500, acc <> "D")
    400 -> helper(number - 400, acc <> "CD")
    100 -> helper(number - 100, acc <> "C")
    90 -> helper(number - 90, acc <> "XC")
    50 -> helper(number - 50, acc <> "L")
    40 -> helper(number - 40, acc <> "XL")
    10 -> helper(number - 10, acc <> "X")
    9 -> helper(number - 9, acc <> "IX")
    5 -> helper(number - 5, acc <> "V")
    4 -> helper(number - 4, acc <> "IV")
    1 -> helper(number - 1, acc <> "I")
    _ -> acc
  }
}
