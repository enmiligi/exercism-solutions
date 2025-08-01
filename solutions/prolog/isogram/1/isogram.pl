isogram(S) :- string_lower(S, SL), string_codes(SL, L), isogram(L, []).

isogram([], _).
isogram([0' | S], L) :- !, isogram(S, L).
isogram([0'-| S], L) :- !, isogram(S, L).
isogram([0'.| S], L) :- !, isogram(S, L).
isogram([C|S], L) :- \+ member(C, L), isogram(S, [C | L]).