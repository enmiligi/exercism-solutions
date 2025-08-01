# i looked at that solution for optimising
# https://exercism.org/tracks/nim/exercises/bob/solutions/daveyarwood
import strutils

proc hey*(sentence: string): string =
    let stripped_sentence = sentence.strip(chars=Whitespace)
    let all_upper = not contains(stripped_sentence, {'a'..'z'}) and contains(sentence, {'A'..'Z'})
    let a_question = endsWith(stripped_sentence, '?')
    if len(stripped_sentence) == 0:
        result = "Fine. Be that way!"
        return
    if all_upper and a_question:
        result = "Calm down, I know what I'm doing!"
    elif all_upper:
        result = "Whoa, chill out!"
    elif a_question:
        result = "Sure."
    else:
        result = "Whatever."
