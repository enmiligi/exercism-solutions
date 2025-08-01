module Clock (addDelta, fromHourMin, toString) where
import Text.Printf (printf)

data Clock =
  Time Int Int
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin h m =
  let
    minute = m `mod` 60
    hour = (h + (m `div` 60)) `mod` 24
  in
    Time hour minute

toString :: Clock -> String
toString (Time hour minute) =
  printf "%02d:%02d" hour minute

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute (Time h m) = fromHourMin (hour + h) (minute + m)
