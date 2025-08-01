(ns pangram
  (:require [clojure.string :as str])
  (:import java.lang.Character))

(defn pangram? [sentence]
  (->> sentence
       (str/lower-case)
       (filter #(Character/isLetter %))
       (into #{})
       (= (set "abcdefghijklmnopqrstuvwxyz"))))
