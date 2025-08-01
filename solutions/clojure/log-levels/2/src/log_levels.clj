(ns log-levels
  (:require [clojure.string :as str]))

(def message-regex #"\[(.*)\]:\s*(.*\w)\s*")

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (nth (re-matches message-regex s) 2))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (str/lower-case
   (second (re-matches message-regex s))))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (format "%s (%s)"
          (message s)
          (log-level s)))
