import sequtils, math

proc correct(sides: array[3, int]): bool =
  sides[0] > 0 and (sides.sum() - sides.max()) >= sides.max()

proc isEquilateral*(sides: array[3, int]): bool =
  correct(sides) and sides.deduplicate().len == 1

proc isIsosceles*(sides: array[3, int]): bool =
  correct(sides) and sides.deduplicate().len <= 2

proc isScalene*(sides: array[3, int]): bool =
  correct(sides) and sides.deduplicate().len == 3
