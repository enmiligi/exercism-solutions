(ns complex-numbers)


(defn real [[a b]]
  a)


(defn imaginary [[a b]]
  b)


(defn abs [[a b]]
  (Math/sqrt (+ (* a a) (* b b))))



(defn conjugate [[a b]]
  [a (- b)])


(defn add [[a b] [c d]]
  [(+ a c) (+ b d)])


(defn sub [[a b] [c d]]
  [(- a c) (- b d)])


(defn mul [[a b] [c d]]
  [(- (* a c) (* b d)) (+ (* a d) (* b c))])



(defn div [a b]
  (let [[x y] (mul a (conjugate b))
        [r _] (mul b (conjugate b))]
    [(/ x r 1.0) (/ y r 1.0)]))
