convert(N, S) :-
    pling(N, PlingS),
    plang(N, PlangS),
    plong(N, PlongS),
    string_concat(PlingS, PlangS, S_),
    string_concat(S_, PlongS, S),
    S \== "", !.
convert(N, S) :-
    number_string(N, S).

pling(N, "Pling") :-
    0 is (N mod 3), !.
pling(_, "").

plang(N, "Plang") :-
    0 is (N mod 5), !.
plang(_, "").

plong(N, "Plong") :-
    0 is (N mod 7), !.
plong(_, "").