(ns gigasecond)

(defn from [year month day]
  (let [date
        (-> (java.time.LocalDateTime/of year month day 0 0)
            (.plus (java.time.Duration/ofSeconds 1000000000)))]
    [(.getYear date)
     (.getMonthValue date)
     (.getDayOfMonth date)]))
