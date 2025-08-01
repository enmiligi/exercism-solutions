(ns accumulate)

(defn accumulate
  ([op coll] (accumulate op coll []))
  ([op coll acc]
   (if (empty? coll)
      acc
      (recur op
             (rest coll)
             (conj acc (op (first coll)))))))
