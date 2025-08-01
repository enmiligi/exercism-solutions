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

const definition_regex = "^: (\\S*) (.*) ;$"

pub fn eval(f: Forth, prog: String) -> Result(Forth, ForthError) {
  assert Ok(def_regex) = regex.from_string(definition_regex)
  let definition = regex.scan(def_regex, lowercase(prog))
  case definition {
    [Match(content: _, submatches: [Some(name), Some(body)])] -> {
      assert Ok(regex) = regex.from_string(int_regex)
      let is_number = check(regex, name)
      case is_number {
        True -> Error(InvalidWord)
        False -> Ok(Forth(f.stack, map.insert(f.words, name, body)))
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

fn eval_expr(f: Forth, word: String) {
  assert Ok(regex) = regex.from_string(int_regex)
  let number = check(regex, word)
  case defined_words(f, word) {
    Ok(forth) -> Ok(forth)
    Error(_) ->
      case number {
        True -> {
          assert Ok(num) = parse(word)
          Ok(Forth([num, ..f.stack], f.words))
        }
        False -> predefined(f, word)
      }
  }
}

const words_unary = ["dup", "drop"]

const words_binary = ["+", "-", "*", "/", "swap", "over"]

fn predefined(f: Forth, word: String) {
  let unary = contains(words_unary, word)
  let binary = contains(words_binary, word)
  case f {
    Forth([0, _, ..], _) if word == "/" -> Error(DivisionByZero)
    Forth([elem1, elem2, ..rest], words) if binary ->
      case word {
        "+" -> Ok(Forth([elem1 + elem2, ..rest], words))
        "-" -> Ok(Forth([elem2 - elem1, ..rest], words))
        "*" -> Ok(Forth([elem1 * elem2, ..rest], words))
        "/" -> Ok(Forth([elem2 / elem1, ..rest], words))
        "swap" -> Ok(Forth([elem2, elem1, ..rest], words))
        "over" -> Ok(Forth([elem2, elem1, elem2, ..rest], words))
      }
    Forth([elem1, ..rest], words) if unary ->
      case word {
        "dup" -> Ok(Forth([elem1, elem1, ..rest], words))
        "drop" -> Ok(Forth(rest, words))
      }
    _ if unary || binary -> Error(StackUnderflow)
    _ -> Error(UnknownWord)
  }
}

fn defined_words(f: Forth, word: String) {
  case map.get(f.words, word) {
    Ok(expr) -> eval(f, expr)
    Error(_) -> Error(UnknownWord)
  }
}
