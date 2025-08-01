(ns grains)

(defn square [square]
  (apply * (repeat (dec square) 2N)))

(defn total []
  (dec (apply * (repeat 64 2N))))
