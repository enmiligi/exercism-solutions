:- use_module(library(clpfd)).


%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard 
% dimensions, e.g. (0,0) or (2,4).
create((DimX, DimY)) :- DimX #< 8, DimY #< 8, DimX #> 0, DimY #> 0.

%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is 
% vulnerable to an attack by another queen positioned on FromTuple.
attack((X,_), (X, _)).
attack((_, Y), (_, Y)).
attack((FromX, FromY), (ToX, ToY)) :- (FromX + FromY) #= (ToX + ToY); FromX + 8 - FromY #= ToX + 8 - ToY.
