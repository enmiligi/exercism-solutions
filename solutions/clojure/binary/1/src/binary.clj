(ns binary)

(defn to-decimal [number-string]
  (reduce (fn [acc char]
            (if-not (<= (int \0) (int char) (int \1))
              (reduced 0)
              (+ (read-string (str char))
                 (* 2 acc))))
          0
          number-string))
