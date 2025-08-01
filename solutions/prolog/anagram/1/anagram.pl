anagram(Word, Candidates, Anagrams) :-
    string_lower(Word, WordL),
    include(anagramString(WordL), Candidates, Anagrams).
anagramString(Word, Candidate) :-
    string_lower(Candidate, CandidateL),
    string_chars(Word, W),
    string_chars(CandidateL, C),
    W \== C,
    anagram(W, C).

anagram([], []).
anagram([C|Word], Candidate) :- deleted(C, Candidate, L), anagram(Word, L).

deleted(X, [C|T], T) :- downcase_atom(C, CL), X = CL, !.
deleted(X, [H|T], [H|T1]) :- deleted(X, T, T1).