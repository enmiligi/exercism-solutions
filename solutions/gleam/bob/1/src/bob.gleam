import gleam/string
import gleam/result
import gleam/regex

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  let empty = remark == ""
  assert Ok(char_regex) = regex.from_string("[a-zA-Z]")
  let yelled =
    remark == string.uppercase(remark) && regex.check(char_regex, remark)
  let question = result.unwrap(string.last(remark), "") == "?"
  case #(empty, yelled, question) {
    #(True, _, _) -> "Fine. Be that way!"
    #(_, True, True) -> "Calm down, I know what I'm doing!"
    #(_, True, _) -> "Whoa, chill out!"
    #(_, _, True) -> "Sure."
    _ -> "Whatever."
  }
}
