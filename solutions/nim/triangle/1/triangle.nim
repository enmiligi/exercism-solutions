proc correct(sides: array[3, int]): bool =
  let (x, y, z) = (sides[0], sides[1], sides[2])
  x > 0 and x + y >= z and y + z >= x and z + x >= y

proc isEquilateral*(sides: array[3, int]): bool =
  correct(sides) and (sides[0] == sides[1] and sides[1] == sides[2])

proc isIsosceles*(sides: array[3, int]): bool =
  let (x, y, z) = (sides[0], sides[1], sides[2])
  correct(sides) and (x == y or y == z or z == x)

proc isScalene*(sides: array[3, int]): bool =
  correct(sides) and not isIsosceles(sides)
