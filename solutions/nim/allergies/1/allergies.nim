import std/tables
import std/setutils

type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

const allergens = {Eggs: 1, Peanuts: 2, Shellfish: 4, Strawberries: 8,
    Tomatoes: 16, Chocolate: 32, Pollen: 64, Cats: 128}.toTable

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  (score and allergens[allergen]) > 0

func allergies*(score: int): set[Allergen] =
  var allergies: seq[Allergen] = @[]
  for allergen in allergens.keys:
    if isAllergicTo(score, allergen):
      allergies.add(allergen)
  return allergies.toSet
