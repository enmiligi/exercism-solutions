import strutils
import sequtils

proc abbreviate*(s: string): string =
  s.toUpper().split({' ', '-'}).mapIt(it.strip()).mapIt(it.filterIt(
      it.isAlphaNumeric(
    ))).mapIt(if it == []: "" else: it[0..0].join()).join()
