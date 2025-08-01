module Anagram
  ( anagramsFor
  ) where

import Prelude

import Data.Array (filter, sort)
import Data.String (toCodePointArray)
import Data.String.Unicode (toUpper)

anagramsFor :: String -> Array String -> Array String
anagramsFor word =
  let
    wordArray = toCodePointArray $ toUpper word
    wordSorted = sort $ wordArray
  in
    filter $ \w ->
      let
        wArray = toCodePointArray $ toUpper w
        wSorted = sort wArray
      in
        wordArray /= wArray && wordSorted == wSorted

