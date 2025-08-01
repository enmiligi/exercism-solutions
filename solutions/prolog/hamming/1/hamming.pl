hamming_distance(Str1, Str2, Dist) :-
    string_chars(Str1, S1),
    string_chars(Str2, S2),
    distance(S1, S2, Dist).

distance([], [], 0).
distance([X | S1], [X | S2], Dist) :-
    !, distance(S1, S2, Dist).
distance([_ | S1], [_ | S2], Dist) :-
    distance(S1, S2, D),
    Dist is D + 1.