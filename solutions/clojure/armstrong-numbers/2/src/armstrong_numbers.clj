(ns armstrong-numbers)

(defn exp
  [x y]
  (reduce * (repeat y x)))

(defn get-digits
  [num]
  (->> (str num)
       (map (comp read-string str))))

(defn armstrong? [num]
  (let [digits (get-digits num)
        exponentiated (map #(exp % (count digits))
                           digits)
        sum (reduce + exponentiated)]
    (= sum num)))
