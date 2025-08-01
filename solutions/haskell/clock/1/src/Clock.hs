module Clock (addDelta, fromHourMin, toString) where

data Clock =
  Time Int Int
  deriving Eq

padWithZeroes2d :: Show a => Num a => a -> [Char]
padWithZeroes2d num =
  if length (show num) == 1 
  then '0' : (show num)
  else show num

fromHourMin :: Int -> Int -> Clock
fromHourMin h m =
  let
    minute = m `mod` 60
    hour = (h + (m `div` 60)) `mod` 24
  in
    Time hour minute

toString :: Clock -> String
toString (Time hour minute) =
  let 
    stringHour = padWithZeroes2d hour
    stringMinute = padWithZeroes2d minute
  in
    stringHour ++ ":" ++ stringMinute 

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute (Time h m) = fromHourMin (hour + h) (minute + m) 
