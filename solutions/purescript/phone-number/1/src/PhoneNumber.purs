module PhoneNumber
  ( phoneNumber
  ) where

import Prelude

import Data.Array (fold)
import Data.Array.NonEmpty (tail)
import Data.Either (hush)
import Data.Maybe (Maybe)
import Data.String.Regex (Regex, regex, match)
import Data.String.Regex.Flags (noFlags)
import Data.Traversable (sequence)

areaCode :: String
areaCode = "\\(?([2-9][0-9][0-9])\\)?"

exchangeCode :: String
exchangeCode = "([2-9][0-9][0-9])"

subscriberNumber :: String
subscriberNumber = "([0-9][0-9][0-9][0-9])"

separators ∷ String
separators = "[-\\s\\.]*"

countryCode :: String
countryCode = "\\+?1?"

regexStr :: String
regexStr =
  "^"
    <> countryCode
    <> separators
    <> areaCode
    <> separators
    <> exchangeCode
    <> separators
    <> subscriberNumber
    <> "\\s*"
    <> "$"

matchRegex :: Maybe Regex
matchRegex =
  hush $ regex regexStr noFlags

phoneNumber :: String -> Maybe String
phoneNumber str = do
  phoneRegex <- matchRegex
  phoneMatch <- match phoneRegex str
  let phoneTail = tail phoneMatch
  matches <- sequence phoneTail
  pure $ fold matches
