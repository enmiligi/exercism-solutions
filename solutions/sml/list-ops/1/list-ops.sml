fun foldl (function: 'b * 'a -> 'b, initial: 'b, list: 'a list): 'b =
  case list of
    h::t => foldl(function, function(initial, h), t)
  | [] => initial

fun reverse (list: 'a list): 'a list =
  foldl((fn(acc, elem) => elem::acc), [], list)

fun foldr (function: 'a * 'b -> 'b, initial: 'b, list: 'a list): 'b =
  foldl(fn(acc, elem) => function(elem, acc), initial, reverse(list))

fun append (list1: 'a list, list2: 'a list): 'a list =
  foldr(fn(elem, acc) => elem::acc, list2, list1)

fun concat (lists: 'a list list): 'a list =
  foldr(append, [], lists)

fun filter (function: 'a -> bool, list: 'a list): 'a list =
  foldr(
    fn(elem, acc) =>
      if function(elem) then elem::acc else acc,
    [],
    list
  )

fun map (function: 'a -> 'b, list: 'a list): 'b list =
  foldr(
    fn(elem, acc) => function(elem)::acc,
    [],
    list
  )

fun length (ns: 'a list): int =
  foldl(
    fn(acc, _) => acc + 1,
    0,
    ns
  )



