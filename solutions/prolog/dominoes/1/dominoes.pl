can_chain([]) :- !.
can_chain(Pieces) :- permutation(Pieces, X), builds_chain(X, P), same(P), !.

same((X, X)).

builds_chain([P], P) :- !.
builds_chain([P1, P2 | Ps], CombinedP) :- chain(P1, P2, P), builds_chain([P | Ps],CombinedP), !.

chain((X1, X), (X, Y), (X1, Y)).
chain((X1, X), (Y, X), (X1, Y)).
chain((X, X1), (X, Y), (X1, Y)).
chain((X, X1), (Y, X), (X1, Y)).