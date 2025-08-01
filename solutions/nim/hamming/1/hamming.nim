import sequtils

proc distance*(dna1, dna2: string): int =
    if len(dna1) == len(dna2):
        for (c1, c2) in dna1.zip(dna2):
            if not (c1 == c2):
                result += 1
    else:
        raise newException(ValueError, "dna strands are not of equal length")
