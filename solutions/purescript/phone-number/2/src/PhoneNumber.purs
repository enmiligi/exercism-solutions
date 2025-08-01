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

phoneNumber :: String -> Maybe String
phoneNumber str = do
  phoneRegex <- matchRegex
  phoneMatch <- match phoneRegex str
  let phoneTail = tail phoneMatch
  matches <- sequence phoneTail
  pure $ fold matches
