import gleam/list

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  list.reverse(do_accumulate(list, fun, []))
}

fn do_accumulate(list: List(a), fun: fn(a) -> b, acc: List(b)) -> List(b) {
  case list {
    [] -> acc
    [x, ..xs] -> do_accumulate(xs, fun, [fun(x), ..acc])
  }
}
