(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> (str plain-text \0)
       (reduce
        (fn [[encoding last-char times] char]
          (if (or (not last-char) (= last-char char))
            (list encoding char (inc times))
            (list (str encoding (if (= times 1) "" times) last-char)
                  char 1)))
        (list "" nil 0))
       first))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->>
   (reduce
    (fn [[plain-text count] char]
      (if (and (<= (int \0) (int char)) (<= (int char) (int \9)))
        (list plain-text (+ (* count 10)
                            (- (int char) (int \0))))
        (list
         (str plain-text
              (if (= count 0)
                char
                (str/join (repeat count char))))
         0)))
    (list "" 0)
    cipher-text)
   first))
