(ns etl
  (:require [clojure.string :as str]))

(defn transform [source]
  (reduce (fn [result [value letters]]
            (reduce #(assoc %1 (str/lower-case %2) value)
                    result
                    letters))
          {}
          source))
