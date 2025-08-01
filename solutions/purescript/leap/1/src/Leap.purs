module Leap
  ( isLeapYear
  ) where

import Prelude

divBy :: Int -> Int -> Boolean
divBy x y = x `mod` y == 0

isLeapYear :: Int -> Boolean
isLeapYear = ((_ `divBy` 4) && not (_ `divBy` 100)) || (_ `divBy` 400)