import strutils

proc abbreviate*(s: string): string =
  for word in s.toUpper().split(Whitespace + {'-', '_', ',', '.'}):
    if word != "":
      result.add(word[0])
