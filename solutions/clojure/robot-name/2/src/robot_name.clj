(ns robot-name)

(def ^:private used-names (ref #{}))

(def ^:private letters
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defn random-name []
  (str
   (rand-nth letters)
   (rand-nth letters)
   (rand-int 1000)))

(defn gen-name-for [robot]
  (assert (= @robot nil))
  (let [name (random-name)]
    (if (some #{name} @used-names)
      (recur robot)
      (dosync
       (alter used-names conj name)
       (alter robot (fn [_] name))))))

(defn robot []
  (let [robot (ref nil)]
    (gen-name-for robot)
    robot))

(defn robot-name [robot]
  @robot)

(defn reset-name [robot]
  (dosync
   (alter used-names disj @robot)
   (alter robot (fn [_] nil)))
  (gen-name-for robot))
