(ns pig-latin
  (:require [clojure.string :as str]))

(defn- translate-word [word]
  (cond
    (#{\a, \e, \i, \o, \u} (first word)) (str word "ay")
    (some (partial str/starts-with? word) ["xr", "yt"]) (str word "ay")
    :else (let [[_ consonant-cluster rest]
                (re-matches #"(.[^aeiouy]*)(.*)" word)
                [_ qu-start qu-rest]
                (re-matches #"([^aeiouy]*qu)(.*)" word)]
            (if qu-start
              (str qu-rest qu-start "ay")
              (str rest consonant-cluster "ay")))))

(defn translate [phrase]
  (->> (str/split phrase #" ")
       (map translate-word)
       (str/join " ")))
