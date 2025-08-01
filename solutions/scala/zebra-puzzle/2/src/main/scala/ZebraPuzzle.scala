object ZebraPuzzle {

  sealed trait Resident
  case object Englishman extends Resident
  case object Spaniard extends Resident
  case object Ukrainian extends Resident
  case object Norwegian extends Resident
  case object Japanese extends Resident

  sealed trait Color
  case object Red extends Color
  case object Green extends Color
  case object Ivory extends Color
  case object Yellow extends Color
  case object Blue extends Color

  sealed trait Pet
  case object Dog extends Pet
  case object Snail extends Pet
  case object Fox extends Pet
  case object Horse extends Pet
  case object Zebra extends Pet

  sealed trait Beverage
  case object Coffee extends Beverage
  case object Tea extends Beverage
  case object Milk extends Beverage
  case object OrangeJuice extends Beverage
  case object Water extends Beverage

  sealed trait Cigarette
  case object OldGold extends Cigarette
  case object Kool extends Cigarette
  case object Chesterfield extends Cigarette
  case object LuckyStrike extends Cigarette
  case object Parliament extends Cigarette

  case class Solution(waterDrinker: Resident, zebraOwner: Resident)

  val colors: Array[Color] = Array(Red, Green, Ivory, Yellow, Blue)
  val nations: Array[Resident] =
    Array(Englishman, Spaniard, Ukrainian, Norwegian, Japanese)
  val pets: Array[Pet] = Array(Dog, Snail, Fox, Horse, Zebra)
  val beverages: Array[Beverage] = Array(Coffee, Tea, Milk, OrangeJuice, Water)
  val cigarettes: Array[Cigarette] =
    Array(OldGold, Kool, Chesterfield, LuckyStrike, Parliament)

  def rightOf[A, B](
      array1: Array[A],
      value1: A,
      array2: Array[B],
      value2: B
  ) =
    array1.indexOf(value1) - array2.indexOf(value2) == 1

  def nextTo[A, B](
      array1: Array[A],
      value1: A,
      array2: Array[B],
      value2: B
  ) =
    (array1.indexOf(value1) - array2.indexOf(value2)).abs == 1

  def sameHouse[A, B](
      array1: Array[A],
      value1: A,
      array2: Array[B],
      value2: B
  ) =
    array1.indexOf(value1) == array2.indexOf(value2)

  def colorRules(colorPerm: Array[Color]) =
    rightOf(colorPerm, Green, colorPerm, Ivory)

  def nationRules(colorPerm: Array[Color], nationPerm: Array[Resident]) =
    sameHouse(colorPerm, Red, nationPerm, Englishman) &&
      nextTo(colorPerm, Blue, nationPerm, Norwegian) &&
      nationPerm(0) == Norwegian

  def petRules(
      colorPerm: Array[Color],
      nationPerm: Array[Resident],
      petPerm: Array[Pet]
  ) =
    sameHouse(nationPerm, Englishman, petPerm, Dog)

  def beverageRules(
      colorPerm: Array[Color],
      nationPerm: Array[Resident],
      petPerm: Array[Pet],
      beveragePerm: Array[Beverage]
  ) =
    sameHouse(beveragePerm, Coffee, colorPerm, Green) &&
      sameHouse(nationPerm, Ukrainian, beveragePerm, Tea) &&
      beveragePerm(2) == Milk

  def cigaretteRules(
      colorPerm: Array[Color],
      nationPerm: Array[Resident],
      petPerm: Array[Pet],
      beveragePerm: Array[Beverage],
      cigarettePerm: Array[Cigarette]
  ) =
    sameHouse(cigarettePerm, OldGold, petPerm, Snail) &&
      sameHouse(cigarettePerm, Kool, colorPerm, Yellow) &&
      nextTo(cigarettePerm, Chesterfield, petPerm, Fox) &&
      nextTo(cigarettePerm, Kool, petPerm, Horse) &&
      sameHouse(cigarettePerm, LuckyStrike, beveragePerm, OrangeJuice) &&
      sameHouse(nationPerm, Japanese, cigarettePerm, Parliament)

  lazy val solutions = for {
    colorPerm <- colors.permutations if colorRules(colorPerm)
    nationPerm <- nations.permutations if nationRules(colorPerm, nationPerm)
    petPerm <- pets.permutations if petRules(colorPerm, nationPerm, petPerm)
    beveragePerm <- beverages.permutations
    if beverageRules(colorPerm, nationPerm, petPerm, beveragePerm)
    cigarettePerm <- cigarettes.permutations if cigaretteRules(
      colorPerm,
      nationPerm,
      petPerm,
      beveragePerm,
      cigarettePerm
    )
  } yield Solution(
    waterDrinker = nationPerm(beveragePerm.indexOf(Water)),
    zebraOwner = nationPerm(petPerm.indexOf(Zebra))
  )

  lazy val solve: Solution = solutions.toList.head
}
