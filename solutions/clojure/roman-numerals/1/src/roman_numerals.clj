(ns roman-numerals)

(def roman-numerals
  [[1000 "M"]
   [900 "CM"]
   [500 "D"]
   [400 "CD"]
   [100 "C"]
   [90 "XC"]
   [50 "L"]
   [40 "XL"]
   [10 "X"]
   [9 "IX"]
   [5 "V"]
   [4 "IV"]
   [1 "I"]])

(defn numerals [number]
  (loop [number number
         numerals ""
         numerals-to-do roman-numerals]
    (let [[value numeral] (first numerals-to-do)]
      (cond
        (= numerals-to-do []) numerals
        (>= number value) (recur (- number value)
                                 (str numerals numeral)
                                 numerals-to-do)
        :else (recur number
                     numerals
                     (rest numerals-to-do))))))
