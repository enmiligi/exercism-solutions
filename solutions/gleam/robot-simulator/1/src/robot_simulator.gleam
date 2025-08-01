pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction: direction, position: position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let #(direction, position) = do_move(direction, position, instructions)
  Robot(direction: direction, position: position)
}

fn do_move(direction: Direction, position: Position, instructions: String) {
  case instructions {
    "R" <> instructions -> {
      let direction = case direction {
        North -> East
        East -> South
        South -> West
        West -> North
      }
      do_move(direction, position, instructions)
    }
    "L" <> instructions -> {
      let direction = case direction {
        North -> West
        East -> North
        South -> East
        West -> South
      }
      do_move(direction, position, instructions)
    }
    "A" <> instructions -> {
      assert Position(x, y) = position
      let position = case direction {
        North -> Position(x, y + 1)
        East -> Position(x + 1, y)
        South -> Position(x, y - 1)
        West -> Position(x - 1, y)
      }
      do_move(direction, position, instructions)
    }
    "" -> #(direction, position)
  }
}
