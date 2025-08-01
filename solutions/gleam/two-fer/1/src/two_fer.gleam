// import gleam/option.{Option, unwrap}

// pub fn two_fer(name: Option(String)) -> String {
//   "One for " <> unwrap(name, "you") <> ", one for me."
// }

import gleam/option.{None, Option, Some}

pub fn two_fer(name: Option(String)) -> String {
  case name {
    Some(person) -> "One for " <> person <> ", one for me."
    None -> "One for you, one for me."
  }
}
