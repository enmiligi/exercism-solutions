(ns difference-of-squares)

(defn square-of-sum [num]
  (let [sum (/ (* num (inc num)) 2)]
    (* sum sum)))

(defn sum-of-squares [num]
  (/
   (* num (inc num) (inc (* 2 num)))
   6))

(defn difference [num]
  (- (square-of-sum num) (sum-of-squares num)))
