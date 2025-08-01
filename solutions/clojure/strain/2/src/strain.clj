(ns strain)

(defn retain
  ([f xs] (retain f xs []))
  ([f xs acc]
   (if (empty? xs)
     acc
    (let [[x & xs] xs]
     (recur f xs
            (if (f x)
                (conj acc x)
                acc))))))
    


(defn discard [f xs]
  (retain (complement f) xs))
