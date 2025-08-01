:- use_module(library(clpfd)).
triangle(A, B, C) :-
    A + B >= C,
    B + C >= A,
    A + C >= B,
    \+ A = 0.

triangle(Side, Side, Side, "equilateral") :-
    Side > 0, !.
triangle(Side1, Side2, Side3, "isosceles") :-
    triangle(Side1, Side2, Side3),
    (Side1 = Side2; Side2 = Side3; Side3 = Side1), !.
triangle(Side1, Side2, Side3, "scalene") :-
    triangle(Side1, Side2, Side3), \+ triangle(Side1, Side2, Side3, "isosceles").