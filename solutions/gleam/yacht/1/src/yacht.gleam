import gleam/list.{filter, length, reduce, sort}
import gleam/int.{compare}

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
      case sort(dice, compare) {
        [a, b, c, d, e] if a == b && c == d && d == e && b != c -> 2 * a + 3 * c
        [a, b, c, d, e] if a == b && b == c && d == e && c != d -> 3 * a + 2 * d
        _ -> 0
      }
    FourOfAKind ->
      case sort(dice, compare) {
        [a, b, c, d, e] if a == b && b == c && c == d || b == c && c == d && d == e ->
          4 * c
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
    Choice -> {
      assert Ok(sum) = reduce(dice, fn(acc, x) { acc + x })
      sum
    }
    Yacht ->
      case dice {
        [a, b, c, d, e] if a == b && b == c && c == d && d == e -> 50
        _ -> 0
      }
  }
}

fn number_combination(number: Int, dice: List(Int)) {
  length(filter(dice, fn(die) { die == number })) * number
}
