import gleam/list.{filter, length, strict_zip}
import gleam/string.{to_utf_codepoints}

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  case strict_zip(to_utf_codepoints(strand1), to_utf_codepoints(strand2)) {
    Error(_) -> Error(Nil)
    Ok(list) -> Ok(length(filter(list, fn(tup) { tup.0 != tup.1 })))
  }
}
