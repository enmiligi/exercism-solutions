import gleam/list

pub fn rows(n: Int) -> List(List(Int)) {
  case n {
    1 -> [[1]]
    _ -> do_rows(n - 1, [[1]])
  }
}

fn do_rows(n: Int, acc: List(List(Int))) -> List(List(Int)) {
  case #(n, acc) {
    #(0, _) -> list.reverse(acc)
    #(_, [row, ..]) -> do_rows(n - 1, [gen_next_row(row, [1]), ..acc])
  }
}

fn gen_next_row(row: List(Int), acc: List(Int)) {
  case row {
    [] -> list.reverse(acc)
    [num1] -> gen_next_row([], [num1, ..acc])
    [num1, num2, ..rest] -> gen_next_row([num2, ..rest], [num1 + num2, ..acc])
  }
}
