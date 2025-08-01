module PhoneNumber
  ( phoneNumber
  ) where

import Prelude

import Control.Apply (lift2)
import Data.Array (fold)
import Data.Array.NonEmpty (tail)
import Data.Either (hush)
import Data.Maybe (Maybe)
import Data.String (joinWith)
import Data.String.Regex (Regex, match, regex)
import Data.String.Regex.Flags (noFlags)
import Data.Traversable (sequence)

regexStr :: String
regexStr = joinWith "[-\\s\\.]*"
  [ "^\\+?1?"
  , "\\(?([2-9]\\d{2})\\)?"
  , "([2-9]\\d{2})"
  , "(\\d{4})"
  , "$"
  ]

matchRegex :: Maybe Regex
matchRegex = hush $ regex regexStr noFlags

-- This functions is more complex than needed
-- See Iteration 2 for a version with do notation
phoneNumber :: String -> Maybe String
phoneNumber =
  pure >>>
    -- lift2 "lifts" match from a function with the type
    -- Regex -> String -> Maybe (NonEmptyArray (Maybe String))
    -- to a function of type
    -- Maybe Regex -> Maybe String -> Maybe (Maybe (NonEmptyArray (Maybe String)))
    lift2 match matchRegex
    -- Because of that double Maybe >>> needs to be replaced with >=> (Kleisli)
    -- (function composition and bind combined)
    >=> map tail
    >=> sequence
      -- sequence transforms the Array (Maybe String)
      -- to a Maybe (Array String)
      >>> map fold
