module Anagram (anagramsFor) where

import Data.List ( sort )
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss =
    let
        toLowerCase = map toLower
        lowerAndSort = sort . toLowerCase
        xsLowerCase = toLowerCase xs
        xsSortLowerCase = sort xsLowerCase
        isAnagram ys = xsLowerCase /= toLowerCase ys && xsSortLowerCase == lowerAndSort ys
    in
        filter isAnagram xss
