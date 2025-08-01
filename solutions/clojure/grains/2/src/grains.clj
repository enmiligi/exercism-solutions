(ns grains)

(defn square [square]
  (.shiftLeft (biginteger 1) (dec square)))

(defn total []
  (dec (square 65)))
