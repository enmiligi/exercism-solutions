(ns bob
  (:require [clojure.string :as str]))

(defn response-for [s]
  (let [s (str/trim s)
        question? (str/ends-with? s "?")
        yell? (and (re-matches #".*\p{L}.*" s)
                   (= s (str/upper-case s)))
        silent? (str/blank? s)
        any-char? ()]
    (cond
      silent? "Fine. Be that way!"
      (and question? yell?) "Calm down, I know what I'm doing!"
      question? "Sure."
      yell? "Whoa, chill out!"
      :else "Whatever.")))
