(ns pascals-triangle)

(defn next-row [prev-row]
  (cons 1N
        (concat (map #(apply + %) (partition 2 1 prev-row))
                '(1N))))

(defn make-triangle
  ([] (cons '(1N)
            (cons
             '(1N 1N)
             (lazy-seq
              (make-triangle '(1N 1N))))))
  ([prev-row]
   (let [next-row (next-row prev-row)]
     (cons next-row
           (lazy-seq (make-triangle next-row))))))

(def triangle (make-triangle))

(defn row [row-num]
  (last (take row-num triangle)))
