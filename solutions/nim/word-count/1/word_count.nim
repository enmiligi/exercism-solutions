import tables, strutils, sequtils, sugar

proc countWords*(text: string): Table[string, int] =
  var splitChars: set[char] = Whitespace + {','}
  let text_without_punctuation = cast[string](text.filter(c =>
      c.isAlphaNumeric or c in splitChars or c == '\''))

  for w in text_without_punctuation.split(splitChars):
    let word = w.strip(true, true, {'\''}).toLower
    if word != "":
      if word in result:
        inc result[word]
      else:
        result[word] = 1
