rna_transcription(Dna, Rna) :-
    string_chars(Dna, L),
    maplist(transcribe, L, RnaL),
    string_chars(Rna, RnaL).

transcribe('G', 'C').
transcribe('C', 'G').
transcribe('T', 'A').
transcribe('A', 'U').