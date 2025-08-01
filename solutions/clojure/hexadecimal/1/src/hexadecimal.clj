(ns hexadecimal)

(defn- convert-char [c]
  (if-let [num ({\a 10,
                 \b 11,
                 \c 12,
                 \d 13,
                 \e 14
                 \f 15} c)]
    num
    (if (<= (int \0) (int c) (int \9))
      (read-string (str c))
      nil)))

(defn hex-to-int [num-string]
  (reduce (fn [acc x]
            (if x
              (+ (* acc 16) x)
              (reduced 0)))
          (map convert-char num-string)))
