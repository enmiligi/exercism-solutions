import std/random
import std/sequtils
import std/algorithm
import std/math

type Character* = object
  strength*: int
  dexterity*: int
  constitution*: int
  intelligence*: int
  wisdom*: int
  charisma*: int
  hitpoints*: int

const throwsPerAbility = 4
const summedThrows = 3

proc ability*(): int =
  return (1 .. throwsPerAbility).mapIt(rand(5) + 1).sorted()[1 .. summedThrows].sum()

proc modifier*(n: int): int =
  return floorDiv(n - 10, 2)

proc initCharacter*(): Character =
  let constitution = ability()
  Character(
    strength: ability(),
    dexterity: ability(),
    constitution: constitution,
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
    hitpoints: 10 + modifier(constitution),
  )
