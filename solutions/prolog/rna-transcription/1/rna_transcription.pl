rna_transcription(Dna, Rna) :-
    string_chars(Dna, L),
    transcript(L, RnaL),
    atomics_to_string(RnaL, Rna).

transcript([], []).
transcript(['G'|Dna], ['C'|Rna]) :- transcript(Dna, Rna).
transcript(['C'|Dna], ['G'|Rna]) :- transcript(Dna, Rna).
transcript(['T'|Dna], ['A'|Rna]) :- transcript(Dna, Rna).
transcript(['A'|Dna], ['U'|Rna]) :- transcript(Dna, Rna).