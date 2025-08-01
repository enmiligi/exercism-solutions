import sequtils

proc sum*(number: int, factors: seq[int]): int =
    let filteredFactors = filterIt(factors, it != 0)
    for num in 1..<number:
        if anyIt(filteredFactors, num mod it == 0):
            result += num