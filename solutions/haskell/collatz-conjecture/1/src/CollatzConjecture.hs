module CollatzConjecture (collatz) where

collatz :: (Integral a) => a -> Maybe a
collatz number
  | number <= 0 = Nothing
  | otherwise = Just (fromIntegral (length (collatzList number)))

collatzList :: ({- Num a -} {- Eq a, -} Integral a) => a -> [a]
collatzList 1 = []
collatzList number
  | even number = (number `div` 2) : collatzList (number `div` 2)
  | odd number = (3 * number + 1) : collatzList (3 * number + 1)
  | otherwise = [] -- not needed, but hlint doesn't know that a number is either even or odd
