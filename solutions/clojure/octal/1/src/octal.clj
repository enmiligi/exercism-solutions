(ns octal)

(defn to-decimal [number-string]
  (let [digits-list
        (map #(- (int %) (int \0)) number-string)]
    (if (some #(not (<= 0 % 7)) digits-list)
      0
      (reduce (fn [acc digit]
                (+ (* acc 8) digit))
              digits-list))))
