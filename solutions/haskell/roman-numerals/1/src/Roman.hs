module Roman (numerals) where

roman_numerals :: [(Integer, String)]
roman_numerals = [
  (1000, "M"), (900, "CM"),
  (500, "D"), (400, "CD"),
  (100, "C"), (90, "XC"),
  (50, "L"), (40, "XL"),
  (10, "X"), (9, "IX"),
  (5, "V"), (4, "IV"),
  (1, "I")]

append_numeral :: (Integer, String) -> (Integer, String) -> (Integer, String)
append_numeral (number, converted) (numeral, digit) =
  (number `rem` numeral,
    converted ++ (foldl (++) "" (replicate (fromIntegral (number `div` numeral)) digit)))

numerals :: Integer -> Maybe String
numerals n = Just converted
  where
    (_, converted) = foldl append_numeral (n, "") roman_numerals
  
