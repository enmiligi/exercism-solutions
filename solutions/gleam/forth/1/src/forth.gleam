import gleam/string.{ends_with, join, lowercase, split, starts_with}
import gleam/list.{any, contains, find, map, reverse}
import gleam/int.{parse, to_string}
import gleam/regex.{Match, check, scan}
import gleam/io.{print}
import gleam/option.{Some}

pub type Forth {
  Forth(stack: List(Int), words: List(Word))
}

pub type Word {
  Word(name: String, exprs: String)
}

pub type ForthError {
  DivisionByZero
  StackUnderflow
  InvalidWord
  UnknownWord
}

pub fn new() -> Forth {
  Forth([], [])
}

pub fn format_stack(f: Forth) -> String {
  assert Forth(stack, _) = f
  join(map(reverse(stack), to_string), " ")
}

const int_regex = "^\\d+$"

const word_regex = ": (\\S*) (.*) ;"

pub fn eval(f: Forth, prog: String) -> Result(Forth, ForthError) {
  case prog {
    "" -> Ok(f)
    _ -> {
      let is_word = starts_with(prog, ": ") && ends_with(prog, " ;")
      case is_word {
        True -> {
          assert Forth(stack, words) = f
          assert Ok(regex) = regex.from_string(word_regex)
          assert [Match(content: _, submatches: [Some(name), Some(expr)])] =
            scan(regex, prog)
          assert Ok(regex) = regex.from_string(int_regex)
          let is_number = check(regex, name)
          case is_number {
            True -> Error(InvalidWord)
            False -> Ok(Forth(stack, [Word(name, expr), ..words]))
          }
        }
        False -> {
          let words = map(split(prog, " "), lowercase)
          do_eval(f, words)
        }
      }
    }
  }
}

pub fn do_eval(f: Forth, words: List(String)) {
  case words {
    [] -> Ok(f)
    [word, ..rest] ->
      case eval_expr(f, word) {
        Ok(forth) -> do_eval(forth, rest)
        Error(err) -> Error(err)
      }
  }
}

const operators = ["+", "-", "*", "/"]

const operations = ["dup", "drop", "swap", "over"]

fn is_right_word(w: Word, word: String) {
  assert Word(name, _) = w
  name == word
}

fn eval_expr(f: Forth, word: String) {
  let operator = contains(operators, word)
  let operation = contains(operations, word)
  assert Ok(regex) = regex.from_string(int_regex)
  let number = check(regex, word)
  assert Forth(_, words) = f
  let known_word = any(words, fn(w) { is_right_word(w, word) })
  case word {
    _ if number -> {
      assert Ok(num) = parse(word)
      assert Forth(stack, words) = f
      Ok(Forth([num, ..stack], words))
    }
    _ if known_word -> defined_words(f, word)
    _ if operator -> arithmetic(f, word)
    _ if operation -> stack_ops(f, word)
    _ -> Error(UnknownWord)
  }
}

fn arithmetic(f: Forth, word: String) {
  print(format_stack(f))
  case f {
    Forth([0, _, ..], _) if word == "/" -> Error(DivisionByZero)
    Forth([num1, num2, ..rest], words) ->
      case word {
        "+" -> Ok(Forth([num1 + num2, ..rest], words))
        "-" -> Ok(Forth([num2 - num1, ..rest], words))
        "*" -> Ok(Forth([num1 * num2, ..rest], words))
        "/" -> Ok(Forth([num2 / num1, ..rest], words))
      }
    _ -> Error(StackUnderflow)
  }
}

fn stack_ops(f: Forth, word: String) {
  case word {
    "dup" ->
      case f {
        Forth([num, ..rest], words) -> Ok(Forth([num, num, ..rest], words))
        _ -> Error(StackUnderflow)
      }
    "drop" ->
      case f {
        Forth([_, ..rest], words) -> Ok(Forth(rest, words))
        _ -> Error(StackUnderflow)
      }
    "swap" ->
      case f {
        Forth([num1, num2, ..rest], words) ->
          Ok(Forth([num2, num1, ..rest], words))
        _ -> Error(StackUnderflow)
      }
    "over" ->
      case f {
        Forth([num1, num2, ..rest], words) ->
          Ok(Forth([num2, num1, num2, ..rest], words))
        _ -> Error(StackUnderflow)
      }
  }
}

fn defined_words(f: Forth, word: String) {
  assert Forth(_, words) = f

  case find(words, fn(w) { is_right_word(w, word) }) {
    Ok(w) -> {
      assert Word(_, expr) = w
      eval(f, expr)
    }
    Error(_) -> Error(UnknownWord)
  }
}
