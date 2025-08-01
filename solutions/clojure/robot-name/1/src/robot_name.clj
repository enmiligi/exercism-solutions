(ns robot-name)

(def ^:private used-names (atom []))

(def ^:private letters
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defn random-name []
  (str
   (rand-nth letters)
   (rand-nth letters)
   (rand-int 1000)))

(defn gen-name []
  (let [name (random-name)]
    (if (some #{name} @used-names)
      (recur)
      (do (swap! used-names conj name)
          name))))

(defn robot []
  (atom (gen-name)))

(defn robot-name [robot]
  @robot)

(defn reset-name [robot]
  (swap! robot (fn [_]
                 (gen-name))))
