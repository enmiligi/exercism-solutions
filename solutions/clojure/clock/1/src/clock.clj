(ns clock)

(defn clock->string [[hour minute]]
  (format "%02d:%02d" hour minute))

(defn clock [hours minutes]
  (let [all-minutes (+ minutes (* hours 60))
        positive-hours (mod (int (Math/floor (/ all-minutes 60))) 24)
        positive-minutes (mod all-minutes 60)]
    (list positive-hours positive-minutes)))

(defn add-time [[hour minute] time]
  (clock hour (+ minute time)))
