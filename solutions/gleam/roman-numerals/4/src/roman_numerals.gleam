import gleam/list.{find}

const numerals = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I"),
]

pub fn convert(number: Int) -> String {
  helper(number, "")
}

fn helper(number: Int, acc: String) {
  let is_bigger = fn(pair) {
    let #(num, _) = pair
    number >= num
  }
  case find(numerals, is_bigger) {
    Ok(#(num, numeral)) -> helper(number - num, acc <> numeral)
    _ -> acc
  }
}
