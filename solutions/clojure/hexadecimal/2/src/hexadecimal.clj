(ns hexadecimal)

(def convert-char
  (zipmap "0123456789abcdef" (range 0 16)))

(defn hex-to-int [num-string]
  (reduce (fn [acc x]
            (if x
              (+ (* acc 16) x)
              (reduced 0)))
          (map convert-char num-string)))
