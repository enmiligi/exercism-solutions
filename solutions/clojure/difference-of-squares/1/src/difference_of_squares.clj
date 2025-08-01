(ns difference-of-squares)

(defn square-of-sum [num]
  (let [sum (reduce + (range 1 (inc num)))]
    (* sum sum)))

(defn sum-of-squares [num]
  (let [squares (map #(* % %) (range 1 (inc num)))]
    (reduce + squares)))

(defn difference [num]
  (- (square-of-sum num) (sum-of-squares num)))
