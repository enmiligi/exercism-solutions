(ns robot-simulator)

(defn robot [coordinates direction]
  {:coordinates coordinates :bearing direction})

(defn turn-left [direction]
  (case direction
    :north :west
    :west :south
    :south :east
    :east :north))

(defn turn-right [direction]
  (case direction
    :north :east
    :east :south
    :south :west
    :west :north))

(def advance
  {:north {:x 0, :y 1}
   :west {:x -1, :y 0}
   :south {:x 0, :y -1}
   :east {:x 1, :y 0}})

(defn simulate [instructions robot]
  (reduce (fn [robot instruction]
            (case instruction
              \R (update robot :bearing turn-right)
              \L (update robot :bearing turn-left)
              \A (update robot :coordinates
                         (fn [coordinates step]
                           (merge-with + coordinates step))
                         ;; "add" the coordinate and the step
                         (advance (:bearing robot)))))
          robot
          instructions))
