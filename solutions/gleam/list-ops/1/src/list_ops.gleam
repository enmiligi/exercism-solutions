pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldr(first, second, fn(acc, elem) { [elem, ..acc] })
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldr(lists, [], fn(acc, elem) { append(elem, acc) })
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  foldr(list, [], fn(acc, elem) {
    case function(elem) {
      True -> [elem, ..acc]
      False -> acc
    }
  })
}

pub fn length(list: List(a)) -> Int {
  foldl(list, 0, fn(acc, _) { acc + 1 })
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  foldr(list, [], fn(acc, elem) { [function(elem), ..acc] })
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [h, ..t] -> foldl(t, function(initial, h), function)
    [] -> initial
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  foldl(reverse(list), initial, function)
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(list, [], fn(acc, elem) { [elem, ..acc] })
}
