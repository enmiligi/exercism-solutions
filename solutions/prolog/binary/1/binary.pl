binary(Str, Dec) :-
    string_codes(Str, L),
    reverse(L, LR),
    listToDec(LR, Dec).
listToDec([C|L], Dec) :- N is C - (0'0), between(0, 1, N), listToDec(L, D), Dec is 2 * D + N.
listToDec([], 0).