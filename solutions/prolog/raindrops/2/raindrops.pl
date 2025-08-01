convert(N, S) :-
    pling(N, PlingS),
    plang(N, PlangS),
    plong(N, PlongS),
    string_concat(PlingS, PlangS, S1),
    string_concat(S1, PlongS, S2),
    (S2 == "" -> number_string(N, S); S = S2).

pling(N, "Pling") :-
    0 is (N mod 3), !.
pling(_, "").

plang(N, "Plang") :-
    0 is (N mod 5), !.
plang(_, "").

plong(N, "Plong") :-
    0 is (N mod 7), !.
plong(_, "").