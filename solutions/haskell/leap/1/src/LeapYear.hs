module LeapYear (isLeapYear) where

leapYearsUntil :: Integral a => a -> [a]
leapYearsUntil year = [y | y <- [year, year - 1 .. 1], y `mod` 4 == 0, (y `mod` 100 /= 0) || (y `mod` 400 == 0)]

isLeapYear :: Integer -> Bool
isLeapYear year = head (leapYearsUntil year) == year