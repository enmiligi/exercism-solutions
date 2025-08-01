module RnaTranscription
  ( toRNA
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Data.Traversable (sequence)

transcribe :: Char -> Maybe Char
transcribe 'C' = Just 'G'
transcribe 'G' = Just 'C'
transcribe 'T' = Just 'A'
transcribe 'A' = Just 'U'
transcribe _ = Nothing

toRNA :: String -> Maybe String
toRNA = toCharArray >>> map transcribe >>> sequence >>> map fromCharArray