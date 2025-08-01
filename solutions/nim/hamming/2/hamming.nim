import sequtils, sugar

proc distance*(dna1, dna2: string): int =
  if len(dna1) == len(dna2):
    for (c1, c2) in dna1.zip(dna2):
      if not (c1 == c2):
        result += 1
      else:
        raise newException(ValueError, "dna strands are not of equal length")

# adapted from https://exercism.io/tracks/nim/exercises/hamming/solutions/ea87e0454f254b2c9181d4036551cef3
#[ proc distance*(s1, s2: string): int =
  if s1.len() != s2.len():
    raise newException(ValueError, "dna strands are not of equal length")

  zip(s1, s2)
    .filter(pair => pair[0] != pair[1])
    .len() ]#


# adapted from https://exercism.io/tracks/nim/exercises/hamming/solutions/c61e6412d6e542fc9893c2c63e1876a5
#[ proc distance*(s1, s2: string): uint8 =
  if s1.len == s2.len:
    for i, _ in s1:
      if s1[i] != s2[i]:
        inc result
      else:
        raise newException(ValueError, "dna strands are not of equal length") ]#
