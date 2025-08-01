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

(defn simulate [instructions robot]
  (reduce (fn [robot instruction]
            (case instruction
              \R (update robot :bearing turn-right)
              \L (update robot :bearing turn-left)
              \A (update robot :coordinates
                         (fn [{:keys [x y]}]
                           (case (:bearing robot)
                             :north {:x x, :y (inc y)}
                             :west {:x (dec x), :y y}
                             :south {:x x, :y (dec y)}
                             :east {:x (inc x), :y y})))))
          robot
          instructions))
