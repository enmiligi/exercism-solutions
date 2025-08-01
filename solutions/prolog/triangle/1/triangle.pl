:- use_module(library(clpfd)).
triangle(A, B, C) :-
    eval(A + B) >= C,
    eval(B + C) >= A,
    eval(A + C) >= B,
    \+ A = 0.

triangle(Side1, Side2, Side3, "equilateral") :-
    triangle(Side1, Side2, Side3),
    Side1 = Side2, Side2 = Side3, !.
triangle(Side1, Side2, Side3, "isosceles") :-
    triangle(Side1, Side2, Side3),
    (Side1 = Side2; Side2 = Side3; Side3 = Side1), !.
triangle(Side1, Side2, Side3, "scalene") :-
    triangle(Side1, Side2, Side3), \+ triangle(Side1, Side2, Side3, "isosceles").