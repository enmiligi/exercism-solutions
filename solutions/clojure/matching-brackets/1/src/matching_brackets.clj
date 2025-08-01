(ns matching-brackets)

(def delimiters "[](){}")

(defn valid? [string]
  (= (reduce (fn [to-close c]
               (cond
                 (= \( c) (cons \) to-close)
                 (= \[ c) (cons \] to-close)
                 (= \{ c) (cons \} to-close)
                 (#{\) \] \}} c)
                 (if (= (first to-close) c)
                   (rest to-close)
                   (reduced false))
                 :else to-close))
             ()
             string)
     ()))
