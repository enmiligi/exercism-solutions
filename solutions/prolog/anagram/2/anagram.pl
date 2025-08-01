anagram(Word, Candidates, Anagrams) :-
    string_lower(Word, WordL),
    include(anagramString(WordL), Candidates, Anagrams).
anagramString(Word, Candidate) :-
    string_lower(Candidate, CandidateL),
    string_chars(Word, W),
    string_chars(CandidateL, C),
    W \== C,
    anagram(W, C).

anagram(Word, Candidate) :- msort(Word, Sorted), msort(Candidate, Sorted).