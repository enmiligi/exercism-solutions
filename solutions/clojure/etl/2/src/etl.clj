(ns etl
  (:require [clojure.string :as str]))

(defn transform [source]
  (into {}
        (for [[score letters] source
              letter letters]
          [(str/lower-case letter) score])))
