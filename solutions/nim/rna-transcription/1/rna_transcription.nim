import strutils

proc toRna*(dna: string): string =
    for c in dna:
        case c
        of 'C':
            result.add('G')
        of 'G':
            result.add('C')
        of 'T':
            result.add('A')
        of 'A':
            result.add('U')
        else:
            raise newException(ValueError, "no valid dna string")

