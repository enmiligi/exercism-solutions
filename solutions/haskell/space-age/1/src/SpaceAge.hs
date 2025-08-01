module SpaceAge (Planet (..), ageOn) where

-- import Data.List
import Data.Maybe

data Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune
  deriving (Eq)

planetInEarthYears :: [(Planet, Float)]
planetInEarthYears = [(Mercury, 0.2408467), (Venus, 0.61519726), (Earth, 1), (Mars, 1.8808158), (Jupiter, 11.862615), (Saturn, 29.447498), (Uranus, 84.016846), (Neptune, 164.79132)]

ageOn :: Planet -> Float -> Float
ageOn planet =
  (/ 31557600)
    . (/ fromMaybe 1 (lookup planet planetInEarthYears))

{- ageOn :: Planet -> Float -> Float
ageOn planet seconds = case find (\(pl, _) -> pl == planet) planetInEarthYears of
  Just (_, earthYears) -> seconds / 31557600 / earthYears
  _ -> 0 -}

{- findPlanet :: Planet -> Maybe (Planet, Float)
findPlanet planet = find (\(pl, _) -> pl == planet) planetInEarthYears

tupleAndSeconds :: Fractional p => Maybe (a, p) -> p -> p
tupleAndSeconds (Just (_, earthYears)) secs =
  secs / 31557600 / earthYears
tupleAndSeconds Nothing _ = 0 -}

-- ageOn :: Planet -> Float -> Float
-- ageOn = tupleAndSeconds . findPlanet