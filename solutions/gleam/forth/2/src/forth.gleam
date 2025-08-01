import gleam/string.{join, lowercase, split}
import gleam/list.{contains, map, reverse}
import gleam/int.{parse, to_string}
import gleam/regex.{Match, check}
import gleam/map.{Map}
import gleam/option.{Some}

pub type Forth {
  Forth(stack: List(Int), words: Map(String, String))
}

pub type ForthError {
  DivisionByZero
  StackUnderflow
  InvalidWord
  UnknownWord
}

pub fn new() -> Forth {
  Forth([], map.new())
}

pub fn format_stack(f: Forth) -> String {
  join(map(reverse(f.stack), to_string), " ")
}

const int_regex = "^\\d+$"

const definition_regex = "^: (.*) ;$"

pub fn eval(f: Forth, prog: String) -> Result(Forth, ForthError) {
  assert Ok(def_regex) = regex.from_string(definition_regex)
  let definition = regex.scan(def_regex, prog)
  case definition {
    [Match(content: _, submatches: [Some(body)])] -> {
      let ws = map(split(body, " "), lowercase)
      case ws {
        [name, ..rest] -> {
          assert Ok(regex) = regex.from_string(int_regex)
          let is_number = check(regex, name)
          case is_number {
            True -> Error(InvalidWord)
            False ->
              Ok(Forth(f.stack, map.insert(f.words, name, join(rest, " "))))
          }
        }
      }
    }

    _ -> {
      let words = map(split(prog, " "), lowercase)
      do_eval(f, words)
    }
  }
}

pub fn do_eval(f: Forth, words: List(String)) {
  case words {
    [] -> Ok(f)
    [word, ..rest] -> {
      try forth = eval_expr(f, word)
      do_eval(forth, rest)
    }
  }
}

const operations = ["+", "-", "*", "/", "dup", "drop", "swap", "over"]

fn eval_expr(f: Forth, word: String) {
  let predef = contains(operations, word)
  assert Ok(regex) = regex.from_string(int_regex)
  let number = check(regex, word)
  case defined_words(f, word) {
    Ok(forth) -> Ok(forth)
    Error(_) ->
      case word {
        _ if number -> {
          assert Ok(num) = parse(word)
          Ok(Forth([num, ..f.stack], f.words))
        }
        _ if predef -> predefined(f, word)
        _ -> Error(UnknownWord)
      }
  }
}

const words_1 = ["dup", "drop"]

const words_2 = ["+", "-", "*", "/", "swap", "over"]

fn predefined(f: Forth, word: String) {
  let word_1 = contains(words_1, word)
  let word_2 = contains(words_2, word)
  case f {
    Forth([0, _, ..], _) if word == "/" -> Error(DivisionByZero)
    Forth([elem1, elem2, ..rest], words) if word_2 ->
      case word {
        "+" -> Ok(Forth([elem1 + elem2, ..rest], words))
        "-" -> Ok(Forth([elem2 - elem1, ..rest], words))
        "*" -> Ok(Forth([elem1 * elem2, ..rest], words))
        "/" -> Ok(Forth([elem2 / elem1, ..rest], words))
        "swap" -> Ok(Forth([elem2, elem1, ..rest], words))
        "over" -> Ok(Forth([elem2, elem1, elem2, ..rest], words))
      }
    Forth([elem1, ..rest], words) if word_1 ->
      case word {
        "dup" -> Ok(Forth([elem1, elem1, ..rest], words))
        "drop" -> Ok(Forth(rest, words))
      }
    _ -> Error(StackUnderflow)
  }
}

fn defined_words(f: Forth, word: String) {
  case map.get(f.words, word) {
    Ok(expr) -> eval(f, expr)
    Error(_) -> Error(UnknownWord)
  }
}
