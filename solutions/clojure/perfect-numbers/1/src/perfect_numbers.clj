(ns perfect-numbers)

(defn aliquot-sum [number]
  (reduce + (filter #(zero? (mod number %))
                    (range 1 number))))

(defn classify [number]
  (when (< number 0)
    (throw (IllegalArgumentException.)))
  (let [sum (aliquot-sum number)]
    (cond
      (< sum number) :deficient
      (> sum number) :abundant
      :else :perfect)))
