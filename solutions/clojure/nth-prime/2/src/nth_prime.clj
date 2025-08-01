(ns nth-prime)

(defn ^:private prime? [n]
  (not-any? #(= (mod n %) 0)
            (range 3
                   (inc (Math/round (Math/sqrt n)))
                   2)))

(def ^:private  primes
  (cons 2
        (filter prime? (iterate (partial + 2) 3))))

(defn nth-prime
  "Returns the prime number in the nth position."
  [n]
  (if (< n 1)
    (throw (IllegalArgumentException. "n must be a natural number!"))
    (nth primes (dec n))))
