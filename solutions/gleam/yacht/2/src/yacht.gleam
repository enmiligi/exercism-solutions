import gleam/list.{filter, length, sort, unique}
import gleam/int.{compare}
import gleam/function
import gleam/map

pub type Category {
  Ones
  Twos
  Threes
  Fours
  Fives
  Sixes
  FullHouse
  FourOfAKind
  LittleStraight
  BigStraight
  Choice
  Yacht
}

pub fn score(category: Category, dice: List(Int)) -> Int {
  case category {
    Ones -> number_combination(1, dice)
    Twos -> number_combination(2, dice)
    Threes -> number_combination(3, dice)
    Fours -> number_combination(4, dice)
    Fives -> number_combination(5, dice)
    Sixes -> number_combination(6, dice)
    FullHouse ->
      case groups(dice) {
        [[a, _, _], [b, _]] -> 3 * a + 2 * b
        [[b, _], [a, _, _]] -> 3 * a + 2 * b
        _ -> 0
      }
    FourOfAKind ->
      case groups(dice) {
        [[a, _, _, _], _] -> 4 * a
        [_, [a, _, _, _]] -> 4 * a
        [[a, _, _, _, _]] -> 4 * a
        _ -> 0
      }
    LittleStraight ->
      case sort(dice, compare) {
        [1, 2, 3, 4, 5] -> 30
        _ -> 0
      }
    BigStraight ->
      case sort(dice, compare) {
        [2, 3, 4, 5, 6] -> 30
        _ -> 0
      }
    Choice -> int.sum(dice)
    Yacht ->
      case unique(dice) {
        [_] -> 50
        _ -> 0
      }
  }
}

fn number_combination(number: Int, dice: List(Int)) {
  length(filter(dice, fn(die) { die == number })) * number
}

fn groups(dice: List(Int)) {
  dice
  |> list.group(function.identity)
  |> map.values()
}
