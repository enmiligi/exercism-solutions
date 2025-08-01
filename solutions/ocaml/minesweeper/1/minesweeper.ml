open Base

let row3 (board : string list) (row : int) (column : int) : int list =
  match List.nth board row with
  | None -> [ 0; 0; 0 ]
  | Some row ->
      let row_s = String.to_list row in
      List.map
        ~f:(fun c ->
          match Option.value ~default:' ' (List.nth row_s c) with
          | '*' -> 1
          | _ -> 0)
        [ column - 1; column; column + 1 ]

let sumToString (sum : int) : string =
  match sum with 0 -> " " | _ -> Int.to_string sum

let sumWindow (board : string list) (row : int) (column : int) : string =
  sumToString
    (List.fold ~init:0 ~f:( + )
       (List.concat_map
          ~f:(fun r -> row3 board r column)
          [ row - 1; row; row + 1 ]))

let annotate (board : string list) : string list =
  List.mapi
    ~f:(fun row string ->
      String.concat_mapi
        ~f:(fun col char ->
          match char with '*' -> "*" | _ -> sumWindow board row col)
        string)
    board
