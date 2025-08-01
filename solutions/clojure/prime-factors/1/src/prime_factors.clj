(ns prime-factors)

(defn- div-by? [number divisor]
  (zero? (mod number divisor)))

(def ^:private prime?
  (memoize
   (fn [number]
     (not-any? (partial div-by? number)
               (range 2 (inc (Math/floor (Math/sqrt number))))))))

(def primes (filter prime? (iterate inc 2)))

(defn of
  ([number]
   (of number [] (take-while #(<= % number) primes)))
  ([number prime-factors [prime & primes]]
   (if (= number 1)
     prime-factors
     (if (div-by? number prime)
       (recur (/ number prime) (conj prime-factors prime)
              (cons prime primes))
       (recur number prime-factors primes)))))
