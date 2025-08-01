import gleam/string.{ends_with, is_empty, lowercase, trim, uppercase}

pub fn hey(remark: String) -> String {
  let empty = is_empty(trim(remark))
  let yelled = remark == uppercase(remark) && remark != lowercase(remark)
  let question = ends_with(trim(remark), "?")
  case #(empty, yelled, question) {
    #(True, _, _) -> "Fine. Be that way!"
    #(_, True, True) -> "Calm down, I know what I'm doing!"
    #(_, True, _) -> "Whoa, chill out!"
    #(_, _, True) -> "Sure."
    _ -> "Whatever."
  }
}
