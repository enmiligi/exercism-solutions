(ns raindrops)

(def ^:private sounds
  {3 "Pling"
   5 "Plang"
   7 "Plong"})

(defn convert [number]
  (let [sound
        (reduce (fn [raindrops [divisor sound]]
                  (if (zero? (mod number divisor))
                    (str raindrops sound)
                    raindrops))
                ""
                sounds)]
    (if (= sound "")
      (str number)
      sound)))
