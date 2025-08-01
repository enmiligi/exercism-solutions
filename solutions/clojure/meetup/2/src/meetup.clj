(ns meetup
  (:import java.time.LocalDate
           java.time.temporal.TemporalAdjusters
           java.time.DayOfWeek))

(def ^:private week-days
  {:monday DayOfWeek/MONDAY,
   :tuesday DayOfWeek/TUESDAY,
   :wednesday DayOfWeek/WEDNESDAY,
   :thursday DayOfWeek/THURSDAY,
   :friday DayOfWeek/FRIDAY,
   :saturday DayOfWeek/SATURDAY,
   :sunday DayOfWeek/SUNDAY})

(defn meetup [month year day identifier]
  (let [day (week-days day)
        date (LocalDate/of year month 12)
        new-date
        (.with date
               (if (= identifier :teenth)
                 (TemporalAdjusters/next day)
                 (if (= identifier :last)
                   (TemporalAdjusters/lastInMonth day)
                   (TemporalAdjusters/dayOfWeekInMonth
                    (condp = identifier
                      :first 1
                      :second 2
                      :third 3
                      :fourth 4)
                    day))))]
    [year
     month
     (.getDayOfMonth new-date)]))
