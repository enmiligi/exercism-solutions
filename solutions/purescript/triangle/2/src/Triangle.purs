module Triangle
  ( Triangle(Equilateral, Isosceles, Scalene)
  , triangleKind
  ) where

import Prelude

import Data.Array (zip)
import Data.Either (Either(..))
import Data.Foldable (any)
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
  | any (\(Tuple x s) -> x > s) $ zip [ a, b, c ] [ b + c, a + c, a + b ] =
      Left "Violates inequality"
  | a == b && b == c =
      Right Equilateral
  | any (\(Tuple x y) -> x == y) $ zip [ a, b, c ] [ b, c, a ] =
      Right Isosceles
  | otherwise = Right Scalene