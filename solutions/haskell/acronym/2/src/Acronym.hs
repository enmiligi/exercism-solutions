module Acronym (abbreviate) where

import Data.Char (isLower, isUpper, toUpper)
import Data.Foldable (Foldable (foldl'))

abbreviate :: String -> String
abbreviate xs =
  reverse
    $ foldl'
      ( \abbr (b, c) ->
          if (isDelimiter b && not (isDelimiter c)) || (isLower b && isUpper c)
            then toUpper c : abbr
            else abbr
      )
      ""
    $ zip
      (' ' : xs)
      xs
  where
    isDelimiter c =
      c `elem` "_- "