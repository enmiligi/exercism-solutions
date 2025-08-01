import strutils
proc isIsogram*(word: string): bool =
    let wordlower = word.toLowerAscii()
    for ch in wordlower:
        if wordlower.count(ch) > 1 and (ch in 'a'..'z'):
            return false
    return true
