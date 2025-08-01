(ns prime-factors)

(defn- div-by? [number divisor]
  (zero? (mod number divisor)))

(defn of
  ([number]
   (loop [n number
          candidate 2
          factors []]
     (cond
       (= n 1) factors
       (div-by? n candidate)
       (recur (/ n candidate) candidate (conj factors candidate))
       :else
       (recur n (inc candidate) factors)))))
