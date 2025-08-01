(ns matching-brackets)

(def matching {\( \), \[ \], \{ \}})
(def opening-brackets (set (keys matching)))
(def closing-brackets (set (vals matching)))

(defn valid? [string]
  (= (reduce (fn [to-close c]
               (cond
                 (opening-brackets c) (cons (matching c) to-close)
                 (closing-brackets c)
                 (if (= (first to-close) c)
                   (rest to-close)
                   (reduced false))
                 :else to-close))
             ()
             string)
     ()))
