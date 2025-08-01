import strutils
import sequtils

proc hey*(sentence: string): string =
    let sentence_stripped = strip(sentence, chars = Whitespace)
    let nothing = sentence_stripped == ""
    if nothing:
        result = "Fine. Be that way!"
        return
    let all_upper = 
            all(sentence_stripped, (proc (c: char): bool = not c.isAlphaAscii or c.isUpperAscii)) and
                any(sentence_stripped, proc (c: char): bool = c.isAlphaAscii)
    let a_question = sentence_stripped[(len sentence_stripped) - 1] == '?'
    if all_upper and a_question:
        result = "Calm down, I know what I'm doing!"
    elif all_upper:
        result = "Whoa, chill out!"
    elif a_question:
        result = "Sure."
    else:
        result = "Whatever."
