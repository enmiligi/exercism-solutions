(ns pascals-triangle)

(defn next-row [prev-row]
  (concat '(1N)
          (map + prev-row (rest prev-row))
          '(1N)))

(def triangle (iterate next-row '(1N)))

(defn row [row-num]
  (last (take row-num triangle)))
