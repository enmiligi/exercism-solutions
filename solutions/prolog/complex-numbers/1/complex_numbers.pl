real((X,_), X).
imaginary((_, X), X).

conjugate((R,I), (R, II)) :- II is -I.
abs((R, I), RR) :- RR is sqrt(R * R + I * I).

add((A, B), (C, D), (R, I)) :- R is A + C, I is B + D.
sub((A, B), (C, D), (R, I)) :- R is A - C, I is B - D.

% (a + bi) * (c + di) = (a * c) + (a * di) + (bi * c) + (bi * di)
% (a + bi) * (c + di) = (a * c - b * d) + (a * d + b * c) * i
mul((A, B), (C, D), (R, I)) :- R is A * C - B * D, I is A * D + B * C.
% (a + bi) / (c + di) = (a + bi) * (c - di) / (c + di) * (c - di)
% = (a * c + b * d) + (b * c - a * d)i / (c^2 + d^2)
div((A, B), (C, D), (R, I)) :-
    R is (A * C + B * D) / (C * C + D * D),
    I is (B * C - A * D) / (C * C + D * D).
