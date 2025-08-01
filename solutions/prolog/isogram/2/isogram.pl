isletter(C) :- char_type(C, alpha).
isogram(S) :- 
    string_lower(S, SL),
    string_chars(SL, L),
    include(isletter, L, L2),
    is_set(L2).
