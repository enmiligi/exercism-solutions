(ns sum-of-multiples)

(defn- multiples-below [max num]
  (range num max num))

(defn sum-of-multiples [items level]
  (->> items
       (mapcat (partial multiples-below level))
       set
       (reduce +)))
