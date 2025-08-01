(ns sum-of-multiples)

(defn- multiples-below [max num]
  (range num max num))

(defn sum-of-multiples [items level]
  (reduce +
          (into #{} (reduce concat
                            (map (partial multiples-below level)
                                 items)))))
