module Allergies exposing (Allergy(..), isAllergicTo, toList)
import Bitwise


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats

getBit : Allergy -> Int
getBit allergy =
    case allergy of
        Eggs -> 0
        Peanuts -> 1
        Shellfish -> 2
        Strawberries -> 3
        Tomatoes -> 4
        Chocolate -> 5
        Pollen -> 6
        Cats -> 7

isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    (Bitwise.and (Bitwise.shiftRightBy (getBit allergy) score) 1) == 1


toList : Int -> List Allergy
toList score =
    List.filter
        (\allergy -> isAllergicTo allergy score)
        [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]
