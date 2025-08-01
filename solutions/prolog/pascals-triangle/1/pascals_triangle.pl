pascal(X,L) :- pascalreverse(X, List), reverse(List, L).

pascalreverse(0, []) :- !.
pascalreverse(X, [Row | T]) :- rowAt(X, Row), X_ is X - 1, pascalreverse(X_, T).

rowAt(1, [1]) :- !.
rowAt(2, [1, 1]) :- !.
rowAt(X, [1 | R]) :- X_ is X - 1, rowAt(X_, RowBefore), nextRow(RowBefore, R), !.
nextRow([X, Y | T], [H | T2]) :- H is X + Y, nextRow([Y | T], T2).
nextRow([_], [1]).