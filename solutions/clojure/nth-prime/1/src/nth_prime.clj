(ns nth-prime)

(defn prime? [n]
  (if (< n 2)
    false
    (not (some #(= (mod n %) 0)
               (range 2
                      (inc (Math/round (Math/sqrt n))))))))

(def primes (filter prime? (range)))

(defn nth-prime 
  "Returns the prime number in the nth position."
  [n]
  (if (< n 1)
    (throw (IllegalArgumentException. "n must be positive!"))
    (nth primes (dec n))))
