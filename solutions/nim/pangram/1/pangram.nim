import strutils
proc isPangram*(sentence: string): bool =
    var sentence_lower = sentence.toLowerAscii()
    for ch in 'a'..'z':
        if ch notin sentence_lower:
            result = false
            return
    result = true
