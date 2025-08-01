// next_row algorithm from https://exercism.org/tracks/gleam/exercises/pascals-triangle/solutions/evomassiny
import gleam/list.{append, map, prepend, window_by_2}

pub fn rows(n: Int) -> List(List(Int)) {
  case n {
    1 -> [[1]]
    _ -> do_rows(n - 1, [[1]])
  }
}

fn do_rows(n: Int, acc: List(List(Int))) -> List(List(Int)) {
  case #(n, acc) {
    #(0, _) -> list.reverse(acc)
    #(_, [row, ..]) -> {
      let next_row =
        window_by_2(row)
        |> map(fn(tuple) -> Int { tuple.0 + tuple.1 })
        |> prepend(1)
        |> append([1])
      do_rows(n - 1, [next_row, ..acc])
    }
  }
}
