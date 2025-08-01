pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number < 1 {
    True -> Error(NonPositiveNumber)
    False -> Ok(do_steps(number, 0))
  }
}

fn do_steps(number: Int, acc: Int) -> Int {
  case number, number % 2 {
    1, _ -> acc
    _, 0 -> do_steps(number / 2, acc + 1)
    _, _ -> do_steps(number * 3 + 1, acc + 1)
  }
}
