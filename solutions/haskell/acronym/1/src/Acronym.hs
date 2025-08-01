module Acronym (abbreviate) where

import Data.Char
import Data.Foldable (Foldable (foldl'))

abbreviate :: String -> String
abbreviate xs =
  reverse $
    (\(abbr, _, _) -> abbr) $
      foldl'
        ( \(abbr, beginning, lower) c ->
            if (beginning && not (isDelimiter c)) || (isUpper c && lower)
              then (toUpper c : abbr, False, isLower c)
              else (abbr, isDelimiter c, isLower c)
        )
        ("", True, False)
        xs
  where
    isDelimiter c =
      c `elem` "_- "
