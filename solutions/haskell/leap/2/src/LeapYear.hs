-- refactored version of https://exercism.io/tracks/haskell/exercises/leap/solutions/c36df8a77f3766eed6d93882
-- Since Pattern matching is 'short cercuiting' or applying the first Pattern that satisfies Input, the 'rem' 400 case comes first, otherwise it would need an if.
-- rem vs. mod https://hackage.haskell.org/package/base-4.14.1.0/docs/Prelude.html#t:Integral
-- -> testing the mod or rem remainder against Zero is equal, rem being faster.
module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear yr = case (yr `rem` 4, yr `rem` 100, yr `rem` 400) of
  (_, _, 0) -> True
  (_, 0, _) -> False
  (0, _, _) -> True
  (_, _, _) -> False
