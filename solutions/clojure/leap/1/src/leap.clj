(ns leap)

(defn- divisible-by? [number divisor]
  (zero? (mod number divisor)))

(defn leap-year? [year]
  (let [div-by? (partial divisible-by? year)]
    (or (and (div-by? 4) (not (div-by? 100)))
        (div-by? 400))))
