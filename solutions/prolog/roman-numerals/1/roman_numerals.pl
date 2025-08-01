convert(N, Numeral) :-
    conversion(N, L),
    atomics_to_string(L, Numeral).

conversion(0, []).
conversion(N, [X | LL]) :- conversion(N, X, NN), conversion(NN, LL), !.

conversion(N, 'M', NN) :- N >= 1000, NN is N - 1000, !.
conversion(N, 'CM', NN) :- N >= 900, NN is N - 900, !.
conversion(N, 'D', NN) :- N >= 500, NN is N - 500, !.
conversion(N, 'CD', NN) :- N >= 400, NN is N - 400, !.
conversion(N, 'C', NN) :- N >= 100, NN is N - 100, !.
conversion(N, 'XC', NN) :- N >= 90, NN is N - 90, !.
conversion(N, 'L', NN) :- N >= 50, NN is N - 50, !.
conversion(N, 'XL', NN) :- N >= 40, NN is N - 40, !.
conversion(N, 'X', NN) :- N >= 10, NN is N - 10, !.
conversion(N, 'IX', NN) :- N >= 9, NN is N - 9, !.
conversion(N, 'V', NN) :- N >= 5, NN is N - 5, !.
conversion(N, 'IV', NN) :- N >= 4, NN is N - 4, !.
conversion(N, 'I', NN) :- NN is N - 1.
