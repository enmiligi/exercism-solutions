module Pangram (isPangram) where
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text =
    let
        textLower = map toLower text
        alphabet = ['a'..'z']
        contained = map (`elem` textLower) chars
    in
        and contained