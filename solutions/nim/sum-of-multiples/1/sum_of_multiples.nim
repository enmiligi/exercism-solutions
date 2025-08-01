import sequtils

proc sum*(number: int, factors: seq[int]): int =
    let filteredFactors = filter(factors, proc (factor: int): bool = factor != 0)
    let numbers = 1..<number
    for num in numbers:
        if any(filteredFactors, proc (factor: int): bool = num mod factor == 0):
            result += num