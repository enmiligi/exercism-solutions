(ns collatz-conjecture)

(defn next-collatz [num]
  (if (even? num)
    (/ num 2)
    (inc (* num 3))))

(defn collatz [num]
  (if (< num 1)
    (throw (Exception. "num is negative!"))
    (loop [new-num num
           count 0]
      (if (= new-num 1)
        count
        (recur (next-collatz new-num)
               (inc count))))))
