module ScrabbleScore
  ( scoreWord
  ) where

import Prelude

import Data.Foldable (elem, find, sum)
import Data.Maybe (Maybe, fromMaybe)
import Data.String (toUpper)
import Data.String.CodeUnits (toCharArray)
import Data.Tuple (Tuple(..), snd)

scoreMap :: Array (Tuple (Array Char) Int)
scoreMap =
  [ Tuple [ 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ] 1
  , Tuple [ 'D', 'G' ] 2
  , Tuple [ 'B', 'C', 'M', 'P' ] 3
  , Tuple [ 'F', 'H', 'V', 'W', 'Y' ] 4
  , Tuple [ 'K' ] 5
  , Tuple [ 'J', 'X' ] 8
  , Tuple [ 'Q', 'Z' ] 10
  ]

getScore :: Char -> Maybe Int
getScore c = map snd $ find (\(Tuple chars _) -> c `elem` chars) scoreMap

scoreWord :: String -> Int
scoreWord = toUpper >>> toCharArray >>> map getScore >>> map (fromMaybe 0) >>> sum
