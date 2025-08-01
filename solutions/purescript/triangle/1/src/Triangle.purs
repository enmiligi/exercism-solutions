module Triangle
  ( Triangle(Equilateral, Isosceles, Scalene)
  , triangleKind
  ) where

import Prelude

import Data.Array (any, zip)
import Data.Either (Either(..))
import Data.Foldable (sum)
import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Data.Tuple (Tuple(..))

data Triangle
  = Equilateral
  | Isosceles
  | Scalene

derive instance eqTriangle :: Eq Triangle
derive instance genericTriangle :: Generic Triangle _

instance showTriangle :: Show Triangle where
  show = genericShow

triangleKind :: Int -> Int -> Int -> Either String Triangle
triangleKind a b c
  | any (_ <= 0) [ a, b, c ] =
      Left "Invalid lengths"
  | any (\x -> 2 * x > sum [ a, b, c ]) [ a, b, c ] =
      Left "Violates inequality"
  | a == b && b == c =
      Right Equilateral
  | any (\(Tuple x y) -> x == y) $ zip [ a, b, c ] [ b, c, a ] =
      Right Isosceles
  | otherwise = Right Scalene